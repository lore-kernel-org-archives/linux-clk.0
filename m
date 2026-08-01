Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2E9C3C09E4
	for <linux-clk@vger.kernel.org>; Sat,  1 Aug 2026 19:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785614151; cv=none; b=SqAcwxJe2P0H5pvSKaythAj7f3dfE63wTpaWXQntYgP3GC58ItYjLW7AaqmjSpyBA0hmGZJ+RAqdR7naEROiBCc1UQQeAA0Ibt8Vc3mSZDpb/LXk59DUvBOsZEsocCYvoUYtfJsxE89WCdyTe0KQqGRcavKUeoZ8lK7RAd2TXtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785614151; c=relaxed/simple;
	bh=YZ/Vv2zEU6mZyirx3TDiVm9nLZJrYi5Hr9L0/t9260M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oUog9po0Dopj20DhbY253egcySfGelLNmnEPSfd+zUu5dZfRa1tKOFNzGazdVf0+QYSiRfpkH6kQKsx0FXBefA1UZeK7TjHP+b64LzMo7TozP9sC6+01blygTKvD08UfofjjQ8BgbLCFsSm+MQdhAg8syF8XLRv7xCEhVdy5Tp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZNiojN4H; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JnAqIlbZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZNiojN4H";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JnAqIlbZ"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 671J0JYM3526775
	for <linux-clk@vger.kernel.org>; Sat, 1 Aug 2026 19:55:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=C5p2600pg+Z3tWajzP5jli4uFm4ZoIvDyv9
	DErP7pB8=; b=ZNiojN4H2XHO7lIlDJIJmZbcqzPuJGpS1503/JgylnHWteNsDmV
	hLGi41kk2Eeu54rLbSePkYdfJFHFVWMBKOfJFthESXEhEtzBbIcQuxdiyDyXOkow
	p20ECEKVUjKLIaN6WcKQADuhXuIgD1FIoG0lvUcbzWRkn2vb7jgyKXdVoAqhk1St
	ufPDhg6v6X+FSZ8VH398RTKsoz76JCDvH6p9rUA95ZDcPpoMlTnTykAGMWrs8XVU
	K4pSiljr1BhTbRzir2K9GJy9ZC4Rh3ew4UQNq4x8Ya/hI+pSGcRgG2cJ1Rp/Ri3c
	MEqw7NKHz4lCJcJAqSITAG8g2AEPAuaokIQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fsa381e3a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Sat, 01 Aug 2026 19:55:47 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c083f1818so20679611cf.0
        for <linux-clk@vger.kernel.org>; Sat, 01 Aug 2026 12:55:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785614147; x=1786218947; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=C5p2600pg+Z3tWajzP5jli4uFm4ZoIvDyv9DErP7pB8=;
        b=JnAqIlbZRxJGPbI2epE2HlUa5bs8pWDnqi64hLdjwiuYMyMejfJhnbXJ/aWRDju2Fs
         r8slGuTD2xeFkEbJtuk0NBEq2gNXFnDgT1FTpQYM7vWkIxbgNXhY68m6ECD8rwxVPNIU
         vgiA3iRZ/vPcOpfKV8+Mx9x/LXQkTs4v4i8N7JJQ5eR5rpVdh6EySCS+2xt8N4uLLXRR
         GKIAxbmea4gsIQ1XQaXcU7GzUhjtf7P5Zt5fP0V2FKBawv94wY2HM26W09te4lqmouSe
         hcmnvMV70xlf65jqboQGOKvBFlrRSAOY+1I7QAUlFaxcVFlJbuDgNJQ2FIooIMM/bg+D
         u/3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785614147; x=1786218947;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C5p2600pg+Z3tWajzP5jli4uFm4ZoIvDyv9DErP7pB8=;
        b=joVowUIhYhmJ5JT9c9WhZvXkR331cnBtyODC1CjnqZG/CYy2ThofRRmhjnuq4R2/jA
         66I8py1Mr2l5kWAXxa8M3njNAjiZU7qUaxUhyymhxNzEZpWbt9qO2UhF0ygOCMT4DVoZ
         yHrEiTgAY1cvxOGIBMY8rX84jHtdC/zlPCbzu4EeB0uagxR2fLW719kaDSmUyS9dWdkk
         xaoiMJF9pB2wHa3GtziUsFPspzZP5rIyU3COFmEEMQepTco0jxxlzule/TJURK0gOvvL
         1F8MxGC+7Xc/O2MuFJe5K3ZhCbLsNUGMQTtXua0HYYmoL89X8LLZomoEUVXAEGRyOfnC
         UidQ==
X-Forwarded-Encrypted: i=1; AHgh+RpaFx65pd17Yay/RCwftmWhFGORIt5lJgc0vJnA1cFjpOmkSm473T5x4/lURfwuxqlfZRf2hgEOqFM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6TB/L7x6vW9qE4gsFcTNAyFRSrZ0gISGq0Z6mgY8d4IlEvtYv
	7ar9b/5dJIq864bBpsUrN2a9XjjMKTZteWMsyQOV2So4cLr4+8p29Jt3Bd6QViy61mikzJm5/9X
	C/mAoA+0iDOYkyCEtUyN8bSkK/Vkmu9YsWkvAmckwz0b7W5eP+lvA128XhrMQ44g=
X-Gm-Gg: AR+sD12QsUAN5roJLwJvzv88WCDR37lpERCdfj938MsU7DCS/EAn1BYySdiZKFPqbmd
	E/b2ZQJGZr/jNHLPrn6RzWQ7KSZoReDx+xZHTgXuAUMExMHcP/b/dhXZNIU7HRwT5EF4GgbdId5
	AtYrycKrEqA1qD/J/eCnnJ62VvT861x+wqmZbHlEMMpcmyGZ8BKIwWdTsfagB9xTjyp/v7AxTV5
	hUQyKOKrhqqjtLxiJm0IPBHetK+j1uKyYlnGI6XLEGneeIhua3XTVZFRnO4pvUMRcz+07T+qySJ
	OwXgFfG5h4Yl4QLSUX77SjNn0OXBY/TaExsMAR/rFt5nq9cB+rh10n7V6Z0Z+cNzsSLWC3WqOJm
	v61RdxmL+22Ab+GO3
X-Received: by 2002:a05:622a:83:b0:51a:89db:95a4 with SMTP id d75a77b69052e-52b56673d6cmr78414901cf.6.1785614146888;
        Sat, 01 Aug 2026 12:55:46 -0700 (PDT)
X-Received: by 2002:a05:622a:83:b0:51a:89db:95a4 with SMTP id d75a77b69052e-52b56673d6cmr78414531cf.6.1785614146453;
        Sat, 01 Aug 2026 12:55:46 -0700 (PDT)
Received: from quoll ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49808199a5csm111576985e9.4.2026.08.01.12.55.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 12:55:45 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
        Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] dt-bindings: clock: Correct white-space style
Date: Sat,  1 Aug 2026 21:55:41 +0200
Message-ID: <20260801195540.235298-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=17894; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=YZ/Vv2zEU6mZyirx3TDiVm9nLZJrYi5Hr9L0/t9260M=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqbk88ksgxIhZHrFdphci55sYYXkZDI0qtofyjQ
 VVkfva5YViJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCam5PPAAKCRDBN2bmhouD
 1wn5EACOIdGkcCdLATpYr5SfTKrLTqLr9zX/7zeeWkFpsmViJjxOrpk/+Z9sdc4mO6oD4Zq2b2J
 y/d9ET/a2gXhuhAyUMO5e3wftvxgqs0pQe96sWdKeNq5dw/jlHfBf0MDQ1txqAm7qwAjmfY2KuH
 om+zFRWiSQNIa/tQu+XUTq/lmriWkpqj9rGu3p1JmkW4BB20rzkp/x9nlc48QMhurivxfR78M/N
 QwHZXc3CsHCPwFpwd6mwLh9ev9C76PhJX94pe/moOdw3fWJC5BrZvBlKKKzXd5iusrZsxDY6tsL
 5F+KA7OIIzZ2AZU7dGEfirdi20pdyvs3LFotVyxErofbpdpNHO4Avg0Lhsx9ETch+HIbJWw5E7/
 EPckX2a/eYqXUTsbjI0UVi+CA5AERPoWc43ExfPpnkXnJDgX1TZ2/ee0zPWDoQpH43fu6sR9kEq
 oM+fQALJs4HWbZ60xbfPewrP1bIf9L+NxwXgQU+6fuKMhj5yxngsAPEmFpGDiWkJDUGUQyFwwhf
 ADbtYpL6LC/VcynI9IsPVg47h28gDLElmTeAWX4YA5Bwq3QsqDGIWzACh105SsoKQPVmv9aeELV
 b/k89tfJWPGOcMMyV3/+EdcfYCMJXG/5rhPpmWNxIt9cL4tqTrksLO1HbPyCVAVkfUBV7iTsPE+ cwMNi9EqB6Eo3ew==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=KezidwYD c=1 sm=1 tr=0 ts=6a6e4f44 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=iQL6gULKA_Fa5ViYYU0A:9 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAxMDE2MCBTYWx0ZWRfX/IFFLi8xgStX
 YYTgxBx3XKYc3gtYWux6peSYFmEVz1Ow/Gx3b4Ru4Z/t6rSmRk9pri83ZhhInq+P5cICpUw1UQV
 PiPCw0kQSCCW6de/hegaK14vdV8X6tk=
X-Proofpoint-ORIG-GUID: rYkrVXVlkQge8MR2CflzZq6t36nL0k0y
X-Proofpoint-GUID: rYkrVXVlkQge8MR2CflzZq6t36nL0k0y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAxMDE2MCBTYWx0ZWRfX0jvABPaM1U1v
 PdHEE7HdAO8rTFZc8wpQbBBsNX0GOgnS7+VqL1eVN8sLtwe7jw7DrBdBm2QBn0I6EdYVXWv3JR8
 yFRCQV/LNn2jZdVKnANKtFh3FSYi2IJkZ0DjwMN3FEl16SJNeCSIJLSx4CdLNreHssToNEXjHMf
 l0MV4IIuBmSoe+eEcHrkDYxNEXrBEOMvtEdprU03Nzp/fExetuNyWBqLjQjEi5zZFLwLnzRNiXF
 i6AKxRON1Jt80X+WucwLs7EUCnt1/IeLtc0aM8V9cBCBT/ZTEbVyTy2IDgKVb4HrUw9PDBr8lhl
 B/63rH4XSVBSt6yOF1vJsN0kfNhZXqSbKJmg4YoxnCP0hgYr3jQCvODM4U8WtiFhElsy3Ps7dNs
 6WRD7XzHPi250avUt8SUEDnKWZBtr0hXZW+JZKlFCl4tyOg7JmYRtM5ow4cJ+CvngEC+h82Q3A5
 els5HihMJAt4WvhUq7Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-01_03,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 impostorscore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608010160

Correct a few white-space issues, like double space after '=' or before
bracket '{' characters, which will be flagged by dt-check-style.  No
functional changes.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../bindings/clock/mediatek,pericfg.yaml      |   2 +-
 .../bindings/clock/st,stm32mp21-rcc.yaml      | 140 +++++++--------
 .../bindings/clock/st,stm32mp25-rcc.yaml      | 160 +++++++++---------
 .../bindings/clock/xlnx,clocking-wizard.yaml  |   2 +-
 4 files changed, 152 insertions(+), 152 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/mediatek,pericfg.yaml b/Documentation/devicetree/bindings/clock/mediatek,pericfg.yaml
index b98cf45efe2f..f0c8df4d10c8 100644
--- a/Documentation/devicetree/bindings/clock/mediatek,pericfg.yaml
+++ b/Documentation/devicetree/bindings/clock/mediatek,pericfg.yaml
@@ -65,7 +65,7 @@ examples:
 
   - |
     pericfg@10003000 {
-        compatible =  "mediatek,mt7623-pericfg", "mediatek,mt2701-pericfg", "syscon";
+        compatible = "mediatek,mt7623-pericfg", "mediatek,mt2701-pericfg", "syscon";
         reg = <0x10003000 0x1000>;
         #clock-cells = <1>;
         #reset-cells = <1>;
diff --git a/Documentation/devicetree/bindings/clock/st,stm32mp21-rcc.yaml b/Documentation/devicetree/bindings/clock/st,stm32mp21-rcc.yaml
index 4368063c6709..e4d64d4b63c6 100644
--- a/Documentation/devicetree/bindings/clock/st,stm32mp21-rcc.yaml
+++ b/Documentation/devicetree/bindings/clock/st,stm32mp21-rcc.yaml
@@ -125,75 +125,75 @@ examples:
         reg = <0x44200000 0x10000>;
         #clock-cells = <1>;
         #reset-cells = <1>;
-        clocks =  <&scmi_clk CK_SCMI_HSE>,
-                  <&scmi_clk CK_SCMI_HSI>,
-                  <&scmi_clk CK_SCMI_MSI>,
-                  <&scmi_clk CK_SCMI_LSE>,
-                  <&scmi_clk CK_SCMI_LSI>,
-                  <&scmi_clk CK_SCMI_HSE_DIV2>,
-                  <&scmi_clk CK_SCMI_ICN_HS_MCU>,
-                  <&scmi_clk CK_SCMI_ICN_LS_MCU>,
-                  <&scmi_clk CK_SCMI_ICN_SDMMC>,
-                  <&scmi_clk CK_SCMI_ICN_DDR>,
-                  <&scmi_clk CK_SCMI_ICN_DISPLAY>,
-                  <&scmi_clk CK_SCMI_ICN_HSL>,
-                  <&scmi_clk CK_SCMI_ICN_NIC>,
-                  <&scmi_clk CK_SCMI_FLEXGEN_07>,
-                  <&scmi_clk CK_SCMI_FLEXGEN_08>,
-                  <&scmi_clk CK_SCMI_FLEXGEN_09>,
-                  <&scmi_clk CK_SCMI_FLEXGEN_10>,
-                  <&scmi_clk CK_SCMI_FLEXGEN_11>,
-                  <&scmi_clk CK_SCMI_FLEXGEN_12>,
-                  <&scmi_clk CK_SCMI_FLEXGEN_13>,
-                  <&scmi_clk CK_SCMI_FLEXGEN_14>,
-                  <&scmi_clk CK_SCMI_FLEXGEN_16>,
-                  <&scmi_clk CK_SCMI_FLEXGEN_17>,
-                  <&scmi_clk CK_SCMI_FLEXGEN_18>,
-                  <&scmi_clk CK_SCMI_FLEXGEN_19>,
-                  <&scmi_clk CK_SCMI_FLEXGEN_20>,
-                  <&scmi_clk CK_SCMI_FLEXGEN_21>,
-                  <&scmi_clk CK_SCMI_FLEXGEN_22>,
-                  <&scmi_clk CK_SCMI_FLEXGEN_23>,
-                  <&scmi_clk CK_SCMI_FLEXGEN_24>,
-                  <&scmi_clk CK_SCMI_FLEXGEN_25>,
-                  <&scmi_clk CK_SCMI_FLEXGEN_26>,
-                  <&scmi_clk CK_SCMI_FLEXGEN_27>,
-                  <&scmi_clk CK_SCMI_FLEXGEN_29>,
-                  <&scmi_clk CK_SCMI_FLEXGEN_30>,
-                  <&scmi_clk CK_SCMI_FLEXGEN_31>,
-                  <&scmi_clk CK_SCMI_FLEXGEN_33>,
-                  <&scmi_clk CK_SCMI_FLEXGEN_36>,
-                  <&scmi_clk CK_SCMI_FLEXGEN_37>,
-                  <&scmi_clk CK_SCMI_FLEXGEN_38>,
-                  <&scmi_clk CK_SCMI_FLEXGEN_39>,
-                  <&scmi_clk CK_SCMI_FLEXGEN_40>,
-                  <&scmi_clk CK_SCMI_FLEXGEN_41>,
-                  <&scmi_clk CK_SCMI_FLEXGEN_42>,
-                  <&scmi_clk CK_SCMI_FLEXGEN_43>,
-                  <&scmi_clk CK_SCMI_FLEXGEN_44>,
-                  <&scmi_clk CK_SCMI_FLEXGEN_45>,
-                  <&scmi_clk CK_SCMI_FLEXGEN_46>,
-                  <&scmi_clk CK_SCMI_FLEXGEN_47>,
-                  <&scmi_clk CK_SCMI_FLEXGEN_48>,
-                  <&scmi_clk CK_SCMI_FLEXGEN_50>,
-                  <&scmi_clk CK_SCMI_FLEXGEN_51>,
-                  <&scmi_clk CK_SCMI_FLEXGEN_52>,
-                  <&scmi_clk CK_SCMI_FLEXGEN_53>,
-                  <&scmi_clk CK_SCMI_FLEXGEN_54>,
-                  <&scmi_clk CK_SCMI_FLEXGEN_55>,
-                  <&scmi_clk CK_SCMI_FLEXGEN_56>,
-                  <&scmi_clk CK_SCMI_FLEXGEN_57>,
-                  <&scmi_clk CK_SCMI_FLEXGEN_58>,
-                  <&scmi_clk CK_SCMI_FLEXGEN_61>,
-                  <&scmi_clk CK_SCMI_FLEXGEN_62>,
-                  <&scmi_clk CK_SCMI_FLEXGEN_63>,
-                  <&scmi_clk CK_SCMI_ICN_APB1>,
-                  <&scmi_clk CK_SCMI_ICN_APB2>,
-                  <&scmi_clk CK_SCMI_ICN_APB3>,
-                  <&scmi_clk CK_SCMI_ICN_APB4>,
-                  <&scmi_clk CK_SCMI_ICN_APB5>,
-                  <&scmi_clk CK_SCMI_ICN_APBDBG>,
-                  <&scmi_clk CK_SCMI_TIMG1>,
-                  <&scmi_clk CK_SCMI_TIMG2>;
+        clocks = <&scmi_clk CK_SCMI_HSE>,
+                 <&scmi_clk CK_SCMI_HSI>,
+                 <&scmi_clk CK_SCMI_MSI>,
+                 <&scmi_clk CK_SCMI_LSE>,
+                 <&scmi_clk CK_SCMI_LSI>,
+                 <&scmi_clk CK_SCMI_HSE_DIV2>,
+                 <&scmi_clk CK_SCMI_ICN_HS_MCU>,
+                 <&scmi_clk CK_SCMI_ICN_LS_MCU>,
+                 <&scmi_clk CK_SCMI_ICN_SDMMC>,
+                 <&scmi_clk CK_SCMI_ICN_DDR>,
+                 <&scmi_clk CK_SCMI_ICN_DISPLAY>,
+                 <&scmi_clk CK_SCMI_ICN_HSL>,
+                 <&scmi_clk CK_SCMI_ICN_NIC>,
+                 <&scmi_clk CK_SCMI_FLEXGEN_07>,
+                 <&scmi_clk CK_SCMI_FLEXGEN_08>,
+                 <&scmi_clk CK_SCMI_FLEXGEN_09>,
+                 <&scmi_clk CK_SCMI_FLEXGEN_10>,
+                 <&scmi_clk CK_SCMI_FLEXGEN_11>,
+                 <&scmi_clk CK_SCMI_FLEXGEN_12>,
+                 <&scmi_clk CK_SCMI_FLEXGEN_13>,
+                 <&scmi_clk CK_SCMI_FLEXGEN_14>,
+                 <&scmi_clk CK_SCMI_FLEXGEN_16>,
+                 <&scmi_clk CK_SCMI_FLEXGEN_17>,
+                 <&scmi_clk CK_SCMI_FLEXGEN_18>,
+                 <&scmi_clk CK_SCMI_FLEXGEN_19>,
+                 <&scmi_clk CK_SCMI_FLEXGEN_20>,
+                 <&scmi_clk CK_SCMI_FLEXGEN_21>,
+                 <&scmi_clk CK_SCMI_FLEXGEN_22>,
+                 <&scmi_clk CK_SCMI_FLEXGEN_23>,
+                 <&scmi_clk CK_SCMI_FLEXGEN_24>,
+                 <&scmi_clk CK_SCMI_FLEXGEN_25>,
+                 <&scmi_clk CK_SCMI_FLEXGEN_26>,
+                 <&scmi_clk CK_SCMI_FLEXGEN_27>,
+                 <&scmi_clk CK_SCMI_FLEXGEN_29>,
+                 <&scmi_clk CK_SCMI_FLEXGEN_30>,
+                 <&scmi_clk CK_SCMI_FLEXGEN_31>,
+                 <&scmi_clk CK_SCMI_FLEXGEN_33>,
+                 <&scmi_clk CK_SCMI_FLEXGEN_36>,
+                 <&scmi_clk CK_SCMI_FLEXGEN_37>,
+                 <&scmi_clk CK_SCMI_FLEXGEN_38>,
+                 <&scmi_clk CK_SCMI_FLEXGEN_39>,
+                 <&scmi_clk CK_SCMI_FLEXGEN_40>,
+                 <&scmi_clk CK_SCMI_FLEXGEN_41>,
+                 <&scmi_clk CK_SCMI_FLEXGEN_42>,
+                 <&scmi_clk CK_SCMI_FLEXGEN_43>,
+                 <&scmi_clk CK_SCMI_FLEXGEN_44>,
+                 <&scmi_clk CK_SCMI_FLEXGEN_45>,
+                 <&scmi_clk CK_SCMI_FLEXGEN_46>,
+                 <&scmi_clk CK_SCMI_FLEXGEN_47>,
+                 <&scmi_clk CK_SCMI_FLEXGEN_48>,
+                 <&scmi_clk CK_SCMI_FLEXGEN_50>,
+                 <&scmi_clk CK_SCMI_FLEXGEN_51>,
+                 <&scmi_clk CK_SCMI_FLEXGEN_52>,
+                 <&scmi_clk CK_SCMI_FLEXGEN_53>,
+                 <&scmi_clk CK_SCMI_FLEXGEN_54>,
+                 <&scmi_clk CK_SCMI_FLEXGEN_55>,
+                 <&scmi_clk CK_SCMI_FLEXGEN_56>,
+                 <&scmi_clk CK_SCMI_FLEXGEN_57>,
+                 <&scmi_clk CK_SCMI_FLEXGEN_58>,
+                 <&scmi_clk CK_SCMI_FLEXGEN_61>,
+                 <&scmi_clk CK_SCMI_FLEXGEN_62>,
+                 <&scmi_clk CK_SCMI_FLEXGEN_63>,
+                 <&scmi_clk CK_SCMI_ICN_APB1>,
+                 <&scmi_clk CK_SCMI_ICN_APB2>,
+                 <&scmi_clk CK_SCMI_ICN_APB3>,
+                 <&scmi_clk CK_SCMI_ICN_APB4>,
+                 <&scmi_clk CK_SCMI_ICN_APB5>,
+                 <&scmi_clk CK_SCMI_ICN_APBDBG>,
+                 <&scmi_clk CK_SCMI_TIMG1>,
+                 <&scmi_clk CK_SCMI_TIMG2>;
     };
 ...
diff --git a/Documentation/devicetree/bindings/clock/st,stm32mp25-rcc.yaml b/Documentation/devicetree/bindings/clock/st,stm32mp25-rcc.yaml
index 1e3b5d218bb0..3b7925d2c175 100644
--- a/Documentation/devicetree/bindings/clock/st,stm32mp25-rcc.yaml
+++ b/Documentation/devicetree/bindings/clock/st,stm32mp25-rcc.yaml
@@ -135,85 +135,85 @@ examples:
         reg = <0x44200000 0x10000>;
         #clock-cells = <1>;
         #reset-cells = <1>;
-        clocks =  <&scmi_clk CK_SCMI_HSE>,
-                  <&scmi_clk CK_SCMI_HSI>,
-                  <&scmi_clk CK_SCMI_MSI>,
-                  <&scmi_clk CK_SCMI_LSE>,
-                  <&scmi_clk CK_SCMI_LSI>,
-                  <&scmi_clk CK_SCMI_HSE_DIV2>,
-                  <&scmi_clk CK_SCMI_ICN_HS_MCU>,
-                  <&scmi_clk CK_SCMI_ICN_LS_MCU>,
-                  <&scmi_clk CK_SCMI_ICN_SDMMC>,
-                  <&scmi_clk CK_SCMI_ICN_DDR>,
-                  <&scmi_clk CK_SCMI_ICN_DISPLAY>,
-                  <&scmi_clk CK_SCMI_ICN_HSL>,
-                  <&scmi_clk CK_SCMI_ICN_NIC>,
-                  <&scmi_clk CK_SCMI_ICN_VID>,
-                  <&scmi_clk CK_SCMI_FLEXGEN_07>,
-                  <&scmi_clk CK_SCMI_FLEXGEN_08>,
-                  <&scmi_clk CK_SCMI_FLEXGEN_09>,
-                  <&scmi_clk CK_SCMI_FLEXGEN_10>,
-                  <&scmi_clk CK_SCMI_FLEXGEN_11>,
-                  <&scmi_clk CK_SCMI_FLEXGEN_12>,
-                  <&scmi_clk CK_SCMI_FLEXGEN_13>,
-                  <&scmi_clk CK_SCMI_FLEXGEN_14>,
-                  <&scmi_clk CK_SCMI_FLEXGEN_15>,
-                  <&scmi_clk CK_SCMI_FLEXGEN_16>,
-                  <&scmi_clk CK_SCMI_FLEXGEN_17>,
-                  <&scmi_clk CK_SCMI_FLEXGEN_18>,
-                  <&scmi_clk CK_SCMI_FLEXGEN_19>,
-                  <&scmi_clk CK_SCMI_FLEXGEN_20>,
-                  <&scmi_clk CK_SCMI_FLEXGEN_21>,
-                  <&scmi_clk CK_SCMI_FLEXGEN_22>,
-                  <&scmi_clk CK_SCMI_FLEXGEN_23>,
-                  <&scmi_clk CK_SCMI_FLEXGEN_24>,
-                  <&scmi_clk CK_SCMI_FLEXGEN_25>,
-                  <&scmi_clk CK_SCMI_FLEXGEN_26>,
-                  <&scmi_clk CK_SCMI_FLEXGEN_27>,
-                  <&scmi_clk CK_SCMI_FLEXGEN_28>,
-                  <&scmi_clk CK_SCMI_FLEXGEN_29>,
-                  <&scmi_clk CK_SCMI_FLEXGEN_30>,
-                  <&scmi_clk CK_SCMI_FLEXGEN_31>,
-                  <&scmi_clk CK_SCMI_FLEXGEN_32>,
-                  <&scmi_clk CK_SCMI_FLEXGEN_33>,
-                  <&scmi_clk CK_SCMI_FLEXGEN_34>,
-                  <&scmi_clk CK_SCMI_FLEXGEN_35>,
-                  <&scmi_clk CK_SCMI_FLEXGEN_36>,
-                  <&scmi_clk CK_SCMI_FLEXGEN_37>,
-                  <&scmi_clk CK_SCMI_FLEXGEN_38>,
-                  <&scmi_clk CK_SCMI_FLEXGEN_39>,
-                  <&scmi_clk CK_SCMI_FLEXGEN_40>,
-                  <&scmi_clk CK_SCMI_FLEXGEN_41>,
-                  <&scmi_clk CK_SCMI_FLEXGEN_42>,
-                  <&scmi_clk CK_SCMI_FLEXGEN_43>,
-                  <&scmi_clk CK_SCMI_FLEXGEN_44>,
-                  <&scmi_clk CK_SCMI_FLEXGEN_45>,
-                  <&scmi_clk CK_SCMI_FLEXGEN_46>,
-                  <&scmi_clk CK_SCMI_FLEXGEN_47>,
-                  <&scmi_clk CK_SCMI_FLEXGEN_48>,
-                  <&scmi_clk CK_SCMI_FLEXGEN_49>,
-                  <&scmi_clk CK_SCMI_FLEXGEN_50>,
-                  <&scmi_clk CK_SCMI_FLEXGEN_51>,
-                  <&scmi_clk CK_SCMI_FLEXGEN_52>,
-                  <&scmi_clk CK_SCMI_FLEXGEN_53>,
-                  <&scmi_clk CK_SCMI_FLEXGEN_54>,
-                  <&scmi_clk CK_SCMI_FLEXGEN_55>,
-                  <&scmi_clk CK_SCMI_FLEXGEN_56>,
-                  <&scmi_clk CK_SCMI_FLEXGEN_57>,
-                  <&scmi_clk CK_SCMI_FLEXGEN_58>,
-                  <&scmi_clk CK_SCMI_FLEXGEN_59>,
-                  <&scmi_clk CK_SCMI_FLEXGEN_60>,
-                  <&scmi_clk CK_SCMI_FLEXGEN_61>,
-                  <&scmi_clk CK_SCMI_FLEXGEN_62>,
-                  <&scmi_clk CK_SCMI_FLEXGEN_63>,
-                  <&scmi_clk CK_SCMI_ICN_APB1>,
-                  <&scmi_clk CK_SCMI_ICN_APB2>,
-                  <&scmi_clk CK_SCMI_ICN_APB3>,
-                  <&scmi_clk CK_SCMI_ICN_APB4>,
-                  <&scmi_clk CK_SCMI_ICN_APBDBG>,
-                  <&scmi_clk CK_SCMI_TIMG1>,
-                  <&scmi_clk CK_SCMI_TIMG2>,
-                  <&scmi_clk CK_SCMI_PLL3>,
-                  <&clk_dsi_txbyte>;
+        clocks = <&scmi_clk CK_SCMI_HSE>,
+                 <&scmi_clk CK_SCMI_HSI>,
+                 <&scmi_clk CK_SCMI_MSI>,
+                 <&scmi_clk CK_SCMI_LSE>,
+                 <&scmi_clk CK_SCMI_LSI>,
+                 <&scmi_clk CK_SCMI_HSE_DIV2>,
+                 <&scmi_clk CK_SCMI_ICN_HS_MCU>,
+                 <&scmi_clk CK_SCMI_ICN_LS_MCU>,
+                 <&scmi_clk CK_SCMI_ICN_SDMMC>,
+                 <&scmi_clk CK_SCMI_ICN_DDR>,
+                 <&scmi_clk CK_SCMI_ICN_DISPLAY>,
+                 <&scmi_clk CK_SCMI_ICN_HSL>,
+                 <&scmi_clk CK_SCMI_ICN_NIC>,
+                 <&scmi_clk CK_SCMI_ICN_VID>,
+                 <&scmi_clk CK_SCMI_FLEXGEN_07>,
+                 <&scmi_clk CK_SCMI_FLEXGEN_08>,
+                 <&scmi_clk CK_SCMI_FLEXGEN_09>,
+                 <&scmi_clk CK_SCMI_FLEXGEN_10>,
+                 <&scmi_clk CK_SCMI_FLEXGEN_11>,
+                 <&scmi_clk CK_SCMI_FLEXGEN_12>,
+                 <&scmi_clk CK_SCMI_FLEXGEN_13>,
+                 <&scmi_clk CK_SCMI_FLEXGEN_14>,
+                 <&scmi_clk CK_SCMI_FLEXGEN_15>,
+                 <&scmi_clk CK_SCMI_FLEXGEN_16>,
+                 <&scmi_clk CK_SCMI_FLEXGEN_17>,
+                 <&scmi_clk CK_SCMI_FLEXGEN_18>,
+                 <&scmi_clk CK_SCMI_FLEXGEN_19>,
+                 <&scmi_clk CK_SCMI_FLEXGEN_20>,
+                 <&scmi_clk CK_SCMI_FLEXGEN_21>,
+                 <&scmi_clk CK_SCMI_FLEXGEN_22>,
+                 <&scmi_clk CK_SCMI_FLEXGEN_23>,
+                 <&scmi_clk CK_SCMI_FLEXGEN_24>,
+                 <&scmi_clk CK_SCMI_FLEXGEN_25>,
+                 <&scmi_clk CK_SCMI_FLEXGEN_26>,
+                 <&scmi_clk CK_SCMI_FLEXGEN_27>,
+                 <&scmi_clk CK_SCMI_FLEXGEN_28>,
+                 <&scmi_clk CK_SCMI_FLEXGEN_29>,
+                 <&scmi_clk CK_SCMI_FLEXGEN_30>,
+                 <&scmi_clk CK_SCMI_FLEXGEN_31>,
+                 <&scmi_clk CK_SCMI_FLEXGEN_32>,
+                 <&scmi_clk CK_SCMI_FLEXGEN_33>,
+                 <&scmi_clk CK_SCMI_FLEXGEN_34>,
+                 <&scmi_clk CK_SCMI_FLEXGEN_35>,
+                 <&scmi_clk CK_SCMI_FLEXGEN_36>,
+                 <&scmi_clk CK_SCMI_FLEXGEN_37>,
+                 <&scmi_clk CK_SCMI_FLEXGEN_38>,
+                 <&scmi_clk CK_SCMI_FLEXGEN_39>,
+                 <&scmi_clk CK_SCMI_FLEXGEN_40>,
+                 <&scmi_clk CK_SCMI_FLEXGEN_41>,
+                 <&scmi_clk CK_SCMI_FLEXGEN_42>,
+                 <&scmi_clk CK_SCMI_FLEXGEN_43>,
+                 <&scmi_clk CK_SCMI_FLEXGEN_44>,
+                 <&scmi_clk CK_SCMI_FLEXGEN_45>,
+                 <&scmi_clk CK_SCMI_FLEXGEN_46>,
+                 <&scmi_clk CK_SCMI_FLEXGEN_47>,
+                 <&scmi_clk CK_SCMI_FLEXGEN_48>,
+                 <&scmi_clk CK_SCMI_FLEXGEN_49>,
+                 <&scmi_clk CK_SCMI_FLEXGEN_50>,
+                 <&scmi_clk CK_SCMI_FLEXGEN_51>,
+                 <&scmi_clk CK_SCMI_FLEXGEN_52>,
+                 <&scmi_clk CK_SCMI_FLEXGEN_53>,
+                 <&scmi_clk CK_SCMI_FLEXGEN_54>,
+                 <&scmi_clk CK_SCMI_FLEXGEN_55>,
+                 <&scmi_clk CK_SCMI_FLEXGEN_56>,
+                 <&scmi_clk CK_SCMI_FLEXGEN_57>,
+                 <&scmi_clk CK_SCMI_FLEXGEN_58>,
+                 <&scmi_clk CK_SCMI_FLEXGEN_59>,
+                 <&scmi_clk CK_SCMI_FLEXGEN_60>,
+                 <&scmi_clk CK_SCMI_FLEXGEN_61>,
+                 <&scmi_clk CK_SCMI_FLEXGEN_62>,
+                 <&scmi_clk CK_SCMI_FLEXGEN_63>,
+                 <&scmi_clk CK_SCMI_ICN_APB1>,
+                 <&scmi_clk CK_SCMI_ICN_APB2>,
+                 <&scmi_clk CK_SCMI_ICN_APB3>,
+                 <&scmi_clk CK_SCMI_ICN_APB4>,
+                 <&scmi_clk CK_SCMI_ICN_APBDBG>,
+                 <&scmi_clk CK_SCMI_TIMG1>,
+                 <&scmi_clk CK_SCMI_TIMG2>,
+                 <&scmi_clk CK_SCMI_PLL3>,
+                 <&clk_dsi_txbyte>;
     };
 ...
diff --git a/Documentation/devicetree/bindings/clock/xlnx,clocking-wizard.yaml b/Documentation/devicetree/bindings/clock/xlnx,clocking-wizard.yaml
index b497c28e8094..3f311f90294e 100644
--- a/Documentation/devicetree/bindings/clock/xlnx,clocking-wizard.yaml
+++ b/Documentation/devicetree/bindings/clock/xlnx,clocking-wizard.yaml
@@ -70,7 +70,7 @@ additionalProperties: false
 
 examples:
   - |
-    clock-controller@b0000000  {
+    clock-controller@b0000000 {
         compatible = "xlnx,clocking-wizard";
         reg = <0xb0000000 0x10000>;
         #clock-cells = <1>;
-- 
2.53.0

