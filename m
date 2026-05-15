Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3C8648094C
	for <linux-clk@vger.kernel.org>; Fri, 15 May 2026 11:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778846382; cv=none; b=Xa63/H1pDpq/AQkTh9ZoBKI0rc5gRx04XXymfmjBhG93wnUQxerzHZ9t1g3Mu9Ql5MiSzFCCBfVma+YpoTb1XNp2s9nsiMC4pCh0au9dbaVx8cAabccismkujSngZoNIFkMcmiTtqIxZwj5bD8k3/pOzzv8wZnZ/f8dAhirM0kQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778846382; c=relaxed/simple;
	bh=4istmFzgYlfp+3pK/b/yydNyM7TS9776WXEDwC5EuFE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kcATzjjHzmIzDvV53uZ3VKx48FKyI888SFyfrqJKe4oIqH7nrL8byXBz9WrDLYIlEcS4dN29cvRX1CeoDkg3ExP8boZKj+agw2Epl6FGn9PYMofXQ9k1v0ZNuDhz0w9cfW3WJT0Kj6mupsChOKHux6jw/dYHBtx9za8oqt8Hxs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OLs0ry31; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bFHPxhDH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OLs0ry31";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bFHPxhDH"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64FBdq8S1847950
	for <linux-clk@vger.kernel.org>; Fri, 15 May 2026 11:59:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PyB0x6EOpIHgSsxeRbOJpjE4kVYxEcMju2rDUiJC128=; b=OLs0ry313uuzKwkW
	lIIgVkjVQBYeYx+AYz03YaTu+3iLmP3JpKF0ymImYC7u1+mkokhTWfe8pGJI1iBU
	qPFsn3XraFKYUdfIHqLJIL8eZLoHTlZkx38m7uuhsj4bkxnSKtT73u9H7h/X8lS8
	OGPbYTHv4LlaI9Js7qlqlr6tF1WH/KtzdKX3pM9IZlmYijqffOAx1QbuZ0wionZg
	x38Y9ph1/sJFYxVJ5twyALZuJposXIDkvJa66jibr3zOhgYQd/RtmcutacUBI+Eh
	GyBqQqK4mxn0F8TJSQFe/zuOWU38ge4Z1wCIwWlT8Nr6B623d8hN6kQgeuswy3no
	RNDsPw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1t33cw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 15 May 2026 11:59:39 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50f13da9684so85678181cf.3
        for <linux-clk@vger.kernel.org>; Fri, 15 May 2026 04:59:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778846379; x=1779451179; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PyB0x6EOpIHgSsxeRbOJpjE4kVYxEcMju2rDUiJC128=;
        b=bFHPxhDHJxxf17VAhWBA3OFvfHbSJn1mexh2cSqgXXPjK7i5zm/Eow59bFssdChAYt
         WrgAKUXOOXcItIOiOtYgPrK82kjbEWSpUYPjUjce4sR/c957h0P0f+BLvpPmCV4S92zN
         uA/DRkrRZW1EcTX2k/L7xLpJZehg+u3cD9csxliNx3ASNG95vnWPFB4Wc0Q5V0JS9Nlp
         3GBSjg8rULlJIEcs2MSBccAVoao+t8a5dfnJWmKTqR6wSmi8RZQ+JKbfeBHMk6JJtqgg
         80FOf/UMe4AI/G7ERcPiB0gzcxP86S369EE74+zlJ8ySO4RspGcXEAHvLs7vucmxvzO7
         B3qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778846379; x=1779451179;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PyB0x6EOpIHgSsxeRbOJpjE4kVYxEcMju2rDUiJC128=;
        b=guBSnto/Jsn+qULO/Gu+/YF8pvCvvGstudKiIHpy15SZ+ti/Skn9B0xh1uzkwKp7rC
         paSvVA7HauHZ2wTXykoznG73yLrnW9gc15vYalJn7VZZfkK23SEteHYfs4T5LjHkTalk
         ndo1edTezwrQkoyUIvHq3xnPWcYXQYLCM5GzV77HYFLNvD8+eX3jsUuM+/n+wApY4dk7
         6duL4Q9j6U3PjnxUeSr/UP/WqCDQ+QWr+fWdH1/vX0RmohP3SkyzV/a7JWUozz6xv5Fr
         v5KawBeXBjHML9B185a0D929jqW6PJjyrDtxDZ1/EoVEOkX+HskmFf9W0yWUilYt0D0f
         n/kA==
X-Forwarded-Encrypted: i=1; AFNElJ/btPIBCE6PKkiZPRSTKjLSe4fk+NhqKKGsJ16U1+NrbuPivI/dy5yqqjPLGtZYIuf2Qq6EEKG1W7c=@vger.kernel.org
X-Gm-Message-State: AOJu0YxEHpNhvVmjLMHo03fDT/uCEzuMUHccNuX23Y4PxR+flYI6COfX
	UdpsAO6hwaXaf4hT//zyiLrjv8oHPukjpmTfG2LyjQm8KMiFsbn+g5YiL7cwHsT4hknriTNcduO
	zD/mfj4OIXAY2hiou+4lBKr8XoYSGgkIrw6HNoF1Ew7uXznm4YLsiIO4NrWAdzLw=
X-Gm-Gg: Acq92OHqcDVsYrBvs5+dGKNOFhfewvQu75FRepSCMz0KNfF/6pZYaxKMucyOR0kHv7D
	UOMYf1OIG25Mm7VIzonlQEshDwdvsajgEMW0mx6t70Qmu1/xitkjihuVVHaBI6Zyi42XjcA5Edp
	vBWT09PzgkOyuskgTF5lRVk/CWfCt/qnnisVHAPCM9nhv1wVM1ZPhalNpEH/gbJjRv1lZtdlfFJ
	kwum8VHVOLl0Ynl0ROXyhI68f+Tert3Is52ChY2N/LpQqlv9AdR+0kYTrjlBikNSzNQLT+EK158
	PhGMQWEphI0ZeVBqDkja2U4lvga02JW6S9bw4ci+sd2UE/yBTSo480U/2wfM9gDr/xESV1MGuUF
	6HP8kU/ubvM/DtXha4JlKnLVQT5Ymuu+X3onbxTfm+9j4fWBFW+/H1B0XTV8Pqek/DJBNMHMcQz
	qTo4s3SXOIxJc6one5+u5ppZY9wvhfH5WDADKzZdaryM9gQg==
X-Received: by 2002:a05:622a:8584:b0:50d:83d7:686c with SMTP id d75a77b69052e-5165a1dbf16mr38135481cf.31.1778846379272;
        Fri, 15 May 2026 04:59:39 -0700 (PDT)
X-Received: by 2002:a05:622a:8584:b0:50d:83d7:686c with SMTP id d75a77b69052e-5165a1dbf16mr38135191cf.31.1778846378773;
        Fri, 15 May 2026 04:59:38 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a90f119ff4sm1295651e87.20.2026.05.15.04.59.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 04:59:37 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 15 May 2026 14:59:27 +0300
Subject: [PATCH v2 4/4] arm64: dts: qcom: qrb4210-rb2: enable venus device
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260515-iris-sm6115-v2-4-2ab75229de61@oss.qualcomm.com>
References: <20260515-iris-sm6115-v2-0-2ab75229de61@oss.qualcomm.com>
In-Reply-To: <20260515-iris-sm6115-v2-0-2ab75229de61@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=828;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=4istmFzgYlfp+3pK/b/yydNyM7TS9776WXEDwC5EuFE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqBwqhgyjGcOUdnXQeB8rPm5DVKtG4TYF/bI77Q
 Jd7IcpPDgCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCagcKoQAKCRCLPIo+Aiko
 1f9AB/sHGp8Fg4pArnx1Z42UeNufrImX2xjfVXT962V2SMk65s1WilAknp5tUJ9RtY1KYzdgbjV
 25FawYi+rWFGICj2KMRukrh01LnEkpnEl4k2jcfqy7Tnnt2y7pw9MTrwl3ZdxN5H79cx9uLTzD2
 U3wQvx8iL0BP7U44cskyT5ik08dl75ruzE+Sp3ZSiXHYJ6uR9I7L6thfAcbKTeT6bvwBgo3O0WQ
 LbLbIVolnnqkWaCe66FZjRlk8JwcBPTIEAfHccJFL9CAMgFmcQXFbSw/7GyH8fumldztPXrzmrc
 /aZz8ZxmCRCD/G7fw19xOf0DUxSA8pN+2l3SC+Q36m6KN5do
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=D7Z37PRj c=1 sm=1 tr=0 ts=6a070aab cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=gWtj1UajujENYCbeQTwA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDEyMCBTYWx0ZWRfX1GDlRm9geU2I
 tcNAyTxnLCnrBSqgQQcP9U7SZUTyxxT4/F0iQ+BDO3jjvtO5SN201m6w4+Nr+e+V3NZ0qinujhD
 VzVT2Vk5DfckAGGel39czeSYkoN//vuX3rJUF2uOeP+HrHCbQf6SmPKsK8vwqlTgd8K1EOCuCub
 tIOwwVaM7/Ebon83pvpcn1aqurzGtZXrNz/qu13r3TaRxloN7nbH9p4VfsDRrRpL87oQ/YzPTEM
 lO0/yMiJzG4mpvbkULZXh2QFbY1Ys/3Ff0UuHvhB3bg9KPSTmkqzYb6OupRVPi4GignMW+cvOAA
 yCoLKGdekuMkfb/Ee6B0j7POt956i6imER+GFoGdb6W284pF4JSmmXPESx74jM1DUAi6occXJ53
 Hvm0jvFSNQFjayDsgtBBdTHUFiHpuuIx9xVKEF4kPALdmCiDFpQTXdYhLhb3FXG8Da43S20b32V
 6gc4dosDGNt3sD/6zIw==
X-Proofpoint-ORIG-GUID: gPeTCCPTLgpKMs1o3oQFHvaDl-Z5cFVu
X-Proofpoint-GUID: gPeTCCPTLgpKMs1o3oQFHvaDl-Z5cFVu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_03,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 adultscore=0 phishscore=0 clxscore=1015 bulkscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605150120

Enable the Venus en/decoding device on the Qualcomm RB2 board. The HFI
Gen2 firmware for AR50Lt platforms doesn't work on RB2, so fix the
firmware in the DT for now.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qrb4210-rb2.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts b/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
index 1203172729fa..a6236b09cdbd 100644
--- a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
+++ b/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
@@ -739,6 +739,12 @@ &usb_qmpphy_out {
 	remote-endpoint = <&pmi632_ss_in>;
 };
 
+&venus {
+	firmware-name = "qcom/venus-6.0/venus.mbn";
+
+	status = "okay";
+};
+
 &wifi {
 	/* SoC */
 	vdd-0.8-cx-mx-supply = <&vreg_l8a_0p664>;

-- 
2.47.3

