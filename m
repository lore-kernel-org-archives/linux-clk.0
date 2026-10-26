Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793014265;
	b=2QuFOQoR+ncDNoyjLzlAU7Ja2AAxCpKX669YLFBvnsJhcC6RRIA7KTICWxQFAIEfmSF2
	 0d4h8dbwl9/CSnQFuURTT/TfhaYaD1nWrNE5CtzRAvysGEpGYRonjkF5NCbgPtaKZ0mhi
	 XiOwTohMQtfoOnBOYfXLSlYGrf/aVW1Nh1+hMTBQ8rC6MVOgCs/2Prb2dyYvC83nozkwk
	 y/EExSqmc2halYOr7BqTdPDfMCNWpm8zTYj8nDDz90643iuxAaDvkhCMIWq0X6UfqhLkx
	 S0h8lrdfQ92TdE68mPQs/i8cYjvSg9ESiIP7pVI2NCg2kKXljkKVIS7/h2GDAgJTWQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793014265;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=1u7BOZ4HXoiDpqQfE+eys0BaXB4J5QVKelBVG2AU3rk=;
	b=APnlGiEC8suokSoLFvdKWCDxkWWlj8Djnmbnc2eHB/CmS8KrgDxTyrVI1I6OSJA6kcNz
	 4LvPNFnTWDF0siihZ0LjEbHgxgJgDzi9oICJPaFHgtOCPqv132Eq6cSdnfM4edElPnR/r
	 liBSsBWKlPIwPppJt5D+KPDk+rSslTvCuXXeuwyy6RB8wo1axJ34hh5Oj6x+z78SN0pyv
	 dMMmzo9a4wejCZI0Y8TPplYgUaoGn7ml59HSVwdAXr6lxhRyorQEIXekZaJeVGolN8o1n
	 ktZTpIH5KkN9odATaZMNLdo1xBlJO/J6v74xWNlhayQ+5jZd20d3v78B2PYSwW+GP0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HtLNkUTM;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=e2o3+m+K;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41C8F606A31A
	for <linux-clk@vger.kernel.org>; Mon, 26 Oct 2026 11:31:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41C8F606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HtLNkUTM;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=e2o3+m+K
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAtMkK2009907
	for <linux-clk@vger.kernel.org>; Mon, 26 Oct 2026 11:31:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1u7BOZ4HXoiDpqQfE+eys0BaXB4J5QVKelBVG2AU3rk=; b=HtLNkUTMolx1qtB1
	TW5/7L69PCVG1AC8+nEv8EkukyHyRQJNQb40yUZKsJ5EDYqw72mO+fOSfRLbv0Ac
	zntv23IX5ptpf/UNZH1u9Nv1zjveEE6vBRXzEYa3J8aGU16C12cN9HH7k0ouPM21
	9NrCuCcws56R8cAXOFnt4c0xEw0nflWVMIRPGcWFcplZQZR/k+uRt1S2wbtNLs+a
	zH4FARObvu24avwUyZePi9mVCBUszUwSl9CXTDH/ctx0VbZ05WQesT4mBkMeDa46
	LZF66kpm7M3t2hxvp7tZyMJ0jMihkIyxTitXK/g7z0Vcd4BtWdbr6YP2ZIi773M4
	Cfi8hg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgn27x50k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 26 Oct 2026 11:31:04 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3ab2cb8d5dbso2391984a91.1
        for <linux-clk@vger.kernel.org>; Mon, 26 Oct 2026 04:31:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793014263; x=1793619063; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1u7BOZ4HXoiDpqQfE+eys0BaXB4J5QVKelBVG2AU3rk=;
        b=e2o3+m+KipyRkTqtdXlramFCzv8r8fxjwX+pyT5R06B4lEgJkSYV6/S+tmIwm3h8Vl
         swjzELFX2X+eFS2irzOdIrNiMfSbB5zT4D006UULbfbkDpUPf0AQ03MLe5IVrByBtRd+
         WctOZaq2xilOuegxSsMPZtuwo7s+QiulxYY1WbCsCaFuFG98RK+3YhMKldBF8ZMTmPMI
         Cn3Y4dwZlFvWb4uQTyw6yxTiAFoS1EyYTpUpKLiJDf/xpjY2yHvJNr9wpVWF8YwayQGD
         q3y95QRGb8DUvhOnM1DfONg0g4iGhHnTKLErYCzqnxLuZF1WapZe6qT7BqEPtZuh0pBR
         v2TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793014263; x=1793619063;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1u7BOZ4HXoiDpqQfE+eys0BaXB4J5QVKelBVG2AU3rk=;
        b=hfP+EugABxobqZaIn0qaXizJ3OqGh9rjXp83TqB8GkNBRfg52DrBUJSsOHly4TcVid
         6dfUPzwMjvOd4D+NxBFMpAMig9SBaLS7wQINxTlvzlic8htlF5MwkCBdoUS2jzzAfOtf
         HkUfTwq3XHLTs6kmQxBota8E2DNqV7GQ5c8hdUFw8P6vQko+x1T4kit1HsNuXHuS6+5B
         6FlwaeNkUZywi7Nn9seTf7ZyGbn9GE7t4O75DHzOOvP5mG3EjBAzCVYnLhCTVlTuWMDn
         vVdgO8b+taumccDl77QF2N/WxXYRSTBMJDhdG5yLWv+qpq7bRVqCnDr54H6y4e4DCCKU
         flpw==
X-Forwarded-Encrypted: i=1; AKwUvBy3CdQnwnb+7GpHzk4eXq1+xV1BPTJOr4CQUN8ZpWOhB7/+4PFjkgOWvamXMkREdrYoxD6oXXA3Oto=@vger.kernel.org
X-Gm-Message-State: AFq9FYJYJ1vVcoBn+g1+2zYDkV4hzznP6RNJTfTW9Dqtcq4Qt08Xzcqy
	zVy88v9NO6zu60GPw/p0zVzu9DwsBUSNmmiy0a9BX8ZBX0Gzs2rtXtrqcf67ZlHh2ts5iz76sf+
	+j4J/IH3AjtqPIY6kKKC97Dkr1DT/MIRzqk6SYrdnT7i76YUkCdupgpGHNQjB/a4=
X-Gm-Gg: AYBFou1kk6cstnKJIM5oj1GvE4S5rKiZuJkaQMWVlGen4SiAl8QGwBbBJtOoFEiDz/g
	uMTmqFDzz5reNM5Zn5V5GmTkV0EfsbXMi5wFYIPYTxfqM5PgDmehKCvCIsuVOgigL7aKEBlWvkW
	efpjjzISh12J0WNnROhWhuhkC4Peu4v6l0IoEHHiyNot4GqKj4JqxsEKESDggQyLVVuPfTuZwnu
	1ZbrNgOSYRPUy3lJsoWpb/2DV1RGkcWd1ZYOAT9jV0EPMN49c2ECKNa06bCy1io5vSoWmolRgGk
	kHEUBD25vEmepEN8E+h4EMUTKMtPi8+7vO9hfy+U1nik1vLBBwoOdllaM44KkVa0RHZXPX+kskX
	xCbWHqosaJ9C4gaAcslBOaYY=
X-Received: by 2002:a17:90b:4a49:b0:3ac:9d83:8861 with SMTP id 98e67ed59e1d1-3adeb0f8d94mr5582103a91.67.1793014263369;
        Mon, 26 Oct 2026 04:31:03 -0700 (PDT)
X-Received: by 2002:a17:90b:4a49:b0:3ac:9d83:8861 with SMTP id 98e67ed59e1d1-3adeb0f8d94mr5582076a91.67.1793014262860;
        Mon, 26 Oct 2026 04:31:02 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adec0bcb0asm8020388a91.17.2026.10.26.04.30.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 04:31:01 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 16:59:36 +0530
Subject: [PATCH v2 10/12] arm64: dts: qcom: sa8775p: Add GP M/N clock
 controller
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261026-b4-pdm_clk_gp_mnd_v2-v2-10-ff8e4bc8d567@oss.qualcomm.com>
References: <20261026-b4-pdm_clk_gp_mnd_v2-v2-0-ff8e4bc8d567@oss.qualcomm.com>
In-Reply-To: <20261026-b4-pdm_clk_gp_mnd_v2-v2-0-ff8e4bc8d567@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, netdev@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Authority-Analysis: v=2.4 cv=G7GJgNk5 c=1 sm=1 tr=0 ts=6adf39f8 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=RQSmaMWm8AJIs-iJKlYA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: 2s2h2sSIjWw2hclt2YDCNvTyLsLYpJI_
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA0NSBTYWx0ZWRfX+646hevQ0TSz
 9zu22w8F3gSTeIuYrFqvmpFcC8abTG8umv6FvLAYREiimYFYg85wBA0Sv96jI4Szz4Di2ObomN6
 5BOdQyJqEImQcL08hvo3uHNR/55CHy0=
X-Proofpoint-GUID: 2s2h2sSIjWw2hclt2YDCNvTyLsLYpJI_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA0NSBTYWx0ZWRfX8rJS6M9agHkW
 3BgjJNwPgkyC2/e35n6aBFkBIQrUezacRFnj2ky79cN0maz/ZS5pADtKcXNzHgJM1niXpRS9giA
 CSElvrEUz7yJH4rbVerZh1+vb9iJKGqiXwa94h7g/tgrOto1ribJD71HICqJyGqK+ENZIwHFq1Q
 x+A2dJrsWapsaxrHxyxTG51uzer9bxrwzYaw/SUmfElsYvCzEnwkg5FRTqkGiMQZoivLMD0B4dt
 TIgyW1mvf3x7leqFUg6ErLy9X9UC3U3i6fnXiDZ38GEer/jYo0n9aPrSJ4fX5KbQqcym8DDEXiN
 e8svDkQGlFdlJMzku+sURF992xQ0ekccIbg49uCwzHHY58gpLyqbiFQSp2kCI/27p6N3OTvFy2x
 /LsosYEhL9JXjNbKt2EPwhAbUvGwQH7TQ7Rz9hltX7ktajuiZDkbwAUuY8VI4AeK+r3jKFSKRoa
 mj6aT1Va+Jfjy5tCqEQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 phishscore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610260045

Add the GP M/N clock controller and its pin configuration for SA8775P.
The controller uses the PDM XO4 and AHB clocks from GCC and routes its
output to gpio35.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans.dtsi | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index 1fdb72fa5518446ba2ea582e8362e86bba75c379..4132d288e3a16ab0a6d8b6d0816e85671bd25c73 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -4348,6 +4348,20 @@ opp-384000000 {
 			};
 		};
 
+		gp_mn: clock-controller@88d3000 {
+			compatible = "qcom,sa8775p-gp-mnd", "qcom,sc7280-gp-mnd";
+			reg = <0x0 0x088d3000 0x0 0x1000>;
+			clocks = <&gcc GCC_PDM_XO4_CLK>,
+				 <&gcc GCC_PDM_AHB_CLK>;
+			clock-names = "pdm_clk", "ahb_clk";
+			#clock-cells = <0>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&gp_mn_active>;
+			assigned-clocks = <&gcc GCC_PDM_XO4_CLK>;
+			assigned-clock-rates = <4800000>;
+			status = "disabled";
+		};
+
 		usb_0_hsphy: phy@88e4000 {
 			compatible = "qcom,sa8775p-usb-hs-phy",
 				     "qcom,usb-snps-hs-5nm-phy";
@@ -6017,6 +6031,13 @@ dp1_hot_plug_det: dp1-hot-plug-det-state {
 				bias-disable;
 			};
 
+			gp_mn_active: gp-mn-active-state {
+				pins = "gpio35";
+				function = "gp_mn";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
 			hs0_mi2s_active: hs0-mi2s-active-state {
 				pins = "gpio114", "gpio115", "gpio116", "gpio117";
 				function = "hs0_mi2s";

-- 
2.34.1

