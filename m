Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5136EC77B7A
	for <linux-clk@archiver.kernel.org>; Fri, 19 May 2023 15:57:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231204AbjESP5F (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 19 May 2023 11:57:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230251AbjESP5F (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 19 May 2023 11:57:05 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04D65FE;
        Fri, 19 May 2023 08:57:03 -0700 (PDT)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34JEJl8U020360;
        Fri, 19 May 2023 15:57:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=qcppdkim1;
 bh=Ir5dN+oTdbW+JR+3BqIxqPzQO7UKaVyQxIbd3sYGDc8=;
 b=LT/VNA4vtefSyn5SRRedm2dY7F+vQsBF2Ehs4uAYYqsa0oSEkOJQXv3vM4LeRhZ4F7B3
 z7KMhhaT3/9PaDVeBDY2HBk7Ys163mWQUWTMTzppGInLol44sZaXD9NATkvq/YNujfJR
 tA+2zbmxRqXRAFdIJqmrrIWjH3kIyD6Y+u2LFLVKTOT6fF7zR14g2a7f1oACtXVaxctL
 GAqdkbfnTZ416/8/67Yfc1Yt/D7+z75EpyoBm25pvBv8ehKaiBVFVP1LRE758eFkgKE8
 T1cpDqNqylE+tcMB1tLNWuIzGVjpA52OlJemz3VMnmLpAWY7Z0WuTFL0TCB5zthjk+wt pw== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qp57y10s6-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 19 May 2023 15:57:00 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 34JFuxxv023410
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 19 May 2023 15:56:59 GMT
Received: from hu-jkona-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Fri, 19 May 2023 08:56:54 -0700
From:   Jagadeesh Kona <quic_jkona@quicinc.com>
To:     Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
CC:     Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        "Jagadeesh Kona" <quic_jkona@quicinc.com>,
        Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
Subject: [PATCH 0/4] Add camera clock controller support for SM8550
Date:   Fri, 19 May 2023 21:25:58 +0530
Message-ID: <20230519155602.6642-1-quic_jkona@quicinc.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: lbL1ZCNEt8-lfYA2VjfniPKRJYYXgv5w
X-Proofpoint-ORIG-GUID: lbL1ZCNEt8-lfYA2VjfniPKRJYYXgv5w
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-19_11,2023-05-17_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=922 phishscore=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 mlxscore=0 clxscore=1011
 priorityscore=1501 bulkscore=0 impostorscore=0 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2304280000
 definitions=main-2305190135
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add bindings, driver and devicetree node for camera clock controller
on SM8550.

Depends on [1] for lucid ole pll ops definition
[1] https://patchwork.kernel.org/project/linux-clk/list/?series=746186&state=%2A&archive=both

Jagadeesh Kona (4):
  clk: qcom: clk-alpha-pll: Add support for rivian ole pll ops
  dt-bindings: clock: qcom: Add SM8550 camera clock controller
  clk: qcom: camcc-sm8550: Add camera clock controller driver for SM8550
  arm64: dts: qcom: sm8550: Add camera clock controller

 .../bindings/clock/qcom,sm8550-camcc.yaml     |   82 +
 arch/arm64/boot/dts/qcom/sm8550.dtsi          |   15 +
 drivers/clk/qcom/Kconfig                      |    7 +
 drivers/clk/qcom/Makefile                     |    1 +
 drivers/clk/qcom/camcc-sm8550.c               | 3572 +++++++++++++++++
 drivers/clk/qcom/clk-alpha-pll.h              |    4 +
 include/dt-bindings/clock/qcom,sm8550-camcc.h |  187 +
 7 files changed, 3868 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,sm8550-camcc.yaml
 create mode 100644 drivers/clk/qcom/camcc-sm8550.c
 create mode 100644 include/dt-bindings/clock/qcom,sm8550-camcc.h

-- 
2.40.1

