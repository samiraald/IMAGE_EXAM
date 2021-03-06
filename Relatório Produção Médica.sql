/*
CREATED BY SAMIRA ALVES LUCIO DIAS
DATE: 21/08/2020
GOAL: Report developed to return exams realized by the doctor 619
*/

SELECT LAUDO_RX.CD_LAUDO
      ,ATENDIME.DT_ATENDIMENTO
      ,LAUDO_RX.CD_PED_RX
      ,LAUDO_RX.DT_LAUDO
      ,LAUDO_RX.NM_USUARIO
      ,PED_RX.DT_PEDIDO
      ,PED_RX.CD_ATENDIMENTO
      ,PRESTADOR.CD_PRESTADOR
      ,PRESTADOR.NM_PRESTADOR
      ,PACIENTE.NM_PACIENTE
      ,SET_EXA.NM_SET_EXA
FROM ITPED_RX ITPED_RX
INNER JOIN PED_RX PED_RX
  ON PED_RX.CD_PED_RX = ITPED_RX.CD_PED_RX
INNER JOIN ATENDIME ATENDIME
  ON ATENDIME.CD_ATENDIMENTO = PED_RX.CD_ATENDIMENTO
INNER JOIN PACIENTE PACIENTE
  ON PACIENTE.CD_PACIENTE = ATENDIME.CD_PACIENTE
INNER JOIN LAUDO_RX LAUDO_RX
  ON ITPED_RX.CD_LAUDO = LAUDO_RX.CD_LAUDO
INNER JOIN PRESTADOR PRESTADOR
  ON PRESTADOR.CD_PRESTADOR = LAUDO_RX.CD_PRESTADOR
INNER JOIN SET_EXA SET_EXA
  ON SET_EXA.CD_SET_EXA = PED_RX.CD_SET_EXA

WHERE ATENDIME.CD_MULTI_EMPRESA = '3'
AND LAUDO_RX.CD_PRESTADOR = '619'
AND PED_RX.cd_set_exa in ('34','33','37','39')
AND TRUNC(ATENDIME.DT_ATENDIMENTO) BETWEEN '01/05/2020' AND '31/05/2020'
ORDER BY LAUDO_RX.DT_LAUDO
        ,SET_EXA.NM_SET_EXA
        ,PACIENTE.NM_PACIENTE

;
