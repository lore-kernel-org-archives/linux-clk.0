Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0608AC77B7A
	for <linux-clk@archiver.kernel.org>; Wed, 24 May 2023 18:18:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233242AbjEXSSl (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 24 May 2023 14:18:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229624AbjEXSSi (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 24 May 2023 14:18:38 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD738B6;
        Wed, 24 May 2023 11:18:37 -0700 (PDT)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34OEnIN3015473;
        Wed, 24 May 2023 18:18:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=qcppdkim1;
 bh=8w7/KZmedrqDeax7JKogcU0USgw8sAqehHeW235E4yg=;
 b=oo/tWjwn44xWKJRqHEuMsbsruFjEOTMFF7WadJiq0f4h6eKbJpK1LwS59Uh1/ZF/bWWn
 wmUkb9IpTn9v6YnCe6ejaHUO9X7MC0B9c+JteLJQk9c+QEgGglJD3lrvdO59q38zFvHe
 QYVMh9jvbhfQwiMMmN9xgROkl0p06JeoUr+yhKRF8PlDW/6RjnhB0KSXtBY6+QdeN7vt
 2T0PM5QOr2Pg96mMeIoZFHePMGWGJ6uDLn0fwvUACn3466xQGUzjnIqXsdwi70fDQLPH
 Plq/jGcNULW83yez/lgjAgfdkWyHmA6nCJWcladTBZujvN1ZnHThyvk4nW3mIBV5PF50 5A== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qsf881d0c-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 24 May 2023 18:18:34 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 34OIIX38006797
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 24 May 2023 18:18:33 GMT
Received: from hu-jkona-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Wed, 24 May 2023 11:18:28 -0700
From:   Jagadeesh Kona <quic_jkona@quicinc.com>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
CC:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        "Jagadeesh Kona" <quic_jkona@quicinc.com>,
        Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        "Ajit Pandey" <quic_ajipan@quicinc.com>
Subject: [PATCH V2 0/3] Add graphics clock controller support for SM8550
Date:   Wed, 24 May 2023 23:47:57 +0530
Message-ID: <20230524181800.28717-1-quic_jkona@quicinc.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: TrTBY1l1jHWXoJTcan_iNx9LYTE40F0E
X-Proofpoint-GUID: TrTBY1l1jHWXoJTcan_iNx9LYTE40F0E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-05-24_13,2023-05-24_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 adultscore=0 bulkscore=0 spamscore=0 malwarescore=0
 lowpriorityscore=0 suspectscore=0 mlxlogscore=861 mlxscore=0 phishscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305240151
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add bindings, driver and devicetree node for graphics clock controller on SM8550.

Depends on [1] and [2] for PLL_TEST_CTL_U2 programming and SM8450 GPUCC YAML file
[1] https://patchwork.kernel.org/project/linux-clk/list/?series=750700
[2] https://patchwork.kernel.org/project/linux-clk/list/?series=748562

Jagadeesh Kona (3):
  dt-bindings: clock: qcom: Add SM8550 graphics clock controller
  clk: qcom: gpucc-sm8550: Add support for graphics clock controller
  arm64: dts: qcom: sm8550: Add graphics clock controller

 .../bindings/clock/qcom,sm8450-gpucc.yaml     |   2 +
 arch/arm64/boot/dts/qcom/sm8550.dtsi          |  12 +
 drivers/clk/qcom/Kconfig                      |   8 +
 drivers/clk/qcom/Makefile                     |   1 +
 drivers/clk/qcom/gpucc-sm8550.c               | 611 ++++++++++++++++++
 include/dt-bindings/clock/qcom,sm8550-gpucc.h |  48 ++
 6 files changed, 682 insertions(+)
 create mode 100644 drivers/clk/qcom/gpucc-sm8550.c
 create mode 100644 include/dt-bindings/clock/qcom,sm8550-gpucc.h

-- 
2.40.1

