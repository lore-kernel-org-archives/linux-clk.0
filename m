Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAC3A2E2DDF
	for <linux-clk@vger.kernel.org>; Tue, 12 Aug 2025 03:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754968316; cv=none; b=db0BMwX//Vr9m6rzIKHm8gFoRHJD0oqnUgQUjarozG9VSGd+NJ1MqxFNalZhR9pmF9n3yvvgEDpJB2CB6eUfUXFXFImhKPZxfrGoq//8VCnp8e0Jj/OsApIe4HaXEdCWXuUHh9KJ9D414EJZjTEMgMaup8QS5VVcqwsEKjcl+2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754968316; c=relaxed/simple;
	bh=iWKr94l4C+wGOu32iC4kUTBBxAFqi2csewiI06tugUg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fhO5CSqRMJe0knvYdYOduCj4eHSaANpAwU9tyElWkoC/SGiIufsJx0fS6RRkoRs19MXDmTClKKJ1o0/7tGaBdX/N5l14FNTM0OTDmhLKrhLJn4wl0+yFaHEyp4v8I/r+Lrk9gAb3fEHjD0+VAyZ+DkYWyA79Lq0vaY7lTh0hXFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RsTrpTfp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RsTrpTfp"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57BG358l013084
	for <linux-clk@vger.kernel.org>; Tue, 12 Aug 2025 03:11:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pBAbKSf3/PgS0PaQMsZaEkwPqrlvCqAgfpJXTwwvKk4=; b=RsTrpTfpSvC3eW2n
	/36qwnsRFpCyLjz9MIi++8n1oLmBxmTHlZt/gIaItVC24+qDu8MmiBOzXVX6+zyR
	C8hY4g8LwT+JVML3gQu+fPG4YYiF2V0WJrBVtbuM93AocV8tRHuVDsrbGL93dskC
	qWom8o295AAHgGc4vyBRg2JMnpQ07XRq+cN/Plgb8nSQagGfVyusnpJXfnIrQU4p
	E5a8r3y6k2WZQT6Eb/cXIcXVGuJLrRTt7PGNDk957BB9bdHtqJS2wvUy5N32jEuF
	rPWo7n6tDp1nS/qV29plKLi1ip8OvYON7/VGKB4Mg6B2/SjXTX6qB2fw1mBnGEPl
	TcTkLQ==
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com [209.85.160.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dupmpqnx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 12 Aug 2025 03:11:52 +0000 (GMT)
Received: by mail-oa1-f71.google.com with SMTP id 586e51a60fabf-2d9e7fbff93so8090734fac.2
        for <linux-clk@vger.kernel.org>; Mon, 11 Aug 2025 20:11:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754968312; x=1755573112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pBAbKSf3/PgS0PaQMsZaEkwPqrlvCqAgfpJXTwwvKk4=;
        b=bcEeFYfbKveIGcyEaHJEgSuy9Ulvw8GATgyaNO7fA/i2obLlOFyp2nIX/veWfvEaxZ
         Lc9vBYeAj4Z+cL1LEfL/RTMsmNqGTYHfy6k3dulENmJnh99yDN9jpi0iqPNDyhLXj7AZ
         e34+WVFqxiFjTaDXnM42y2ABIyEjTeqLDmcobg0Pn1JkvKhhwefPjYJR2kIN1A88xwWA
         0S0u6Uu09U1DtYR82pd8/ZPPWaKn6iFh72UWPQxVZlstW/Ox8W1Cw7TkQb2XDlsLg78d
         Ac9MsyPcGNLO8t5EY8aj6Ybj3I4kl+umzZdl1+ZbIVhK/zJ1/yS+M4P8Vn4OSozBeNxE
         Datw==
X-Forwarded-Encrypted: i=1; AJvYcCWmW4rBVfjkEubWij2PJ7kwhmrtIfJSBLNOpVaFu6S8MkZO7EsWsSCwvH82VqlOY9Z8bNOG3m3CJQw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxo5C+JjvGxSvxjRGhzaHOFcZ7DdV4hzBb7i3J1ZwWHR4KRfcLE
	HT1agindbRzE4zgBFzW01OP/9xrjYg6livqTkCxYmU0YB2jwFKJRXzwUE7iZducIPRUfr9TJ9Z9
	oW5vlKeoAxr6h+AeKac6aPCjGjCBI7EudE+eqPgpt9Z3fA+TeZn1k1f5wnZ9M0bM=
X-Gm-Gg: ASbGncsZqU+GCZwYD9sqmeE6/UNm2oxAU2ww7ZWkAmrocUl7YbqpFGJqJOeMzpcTSl6
	a4F+vgUFB1D2IATWF88rWY3x1YggWGmsEWL/wIFLlghkuUOB3MXPkkTOBS+lKnMktTMOQZXYvZN
	AKnWuZcV+pAPn6vMqF/1OBPOZfrivP9I6qVjDUTWJ/4rn+FjLOfWWpK5g5tojd1SOL0oRYZZdJh
	neEcWuVXOQ59lAT9f+59QqsPwsdlpZiyGWXTrgK5LScfsEkht/U+am9hNHL0WrQ6nqC8SRqscTi
	b4atQoxgIWp6p5T1j827X4Yh05vpVaixoWyGfNZ5a48rhbzAywEYtuTcs22+m3eCx+dp1CpqBYs
	eZ4QeY2L1vWXdKLGosBIGaEV8AlOhhb6HS+BHb54=
X-Received: by 2002:a05:6870:8e17:b0:301:fec8:fc5 with SMTP id 586e51a60fabf-30c9504838dmr1239436fac.23.1754968311933;
        Mon, 11 Aug 2025 20:11:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEYeL6E0IFSZGXEtKtjBlJEPzBOueX+0t8ndofxKFQcOfrzO6R1WsxDwocxPN25RhkzaZVT+g==
X-Received: by 2002:a05:6870:8e17:b0:301:fec8:fc5 with SMTP id 586e51a60fabf-30c9504838dmr1239417fac.23.1754968311598;
        Mon, 11 Aug 2025 20:11:51 -0700 (PDT)
Received: from [192.168.86.68] (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-307a717f0c9sm8174531fac.13.2025.08.11.20.11.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 20:11:51 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Date: Mon, 11 Aug 2025 22:11:35 -0500
Subject: [PATCH 3/3] arm64: dts: qcom: sc7280: Add MDSS_CORE reset to mdss
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250811-sc7280-mdss-reset-v1-3-83ceff1d48de@oss.qualcomm.com>
References: <20250811-sc7280-mdss-reset-v1-0-83ceff1d48de@oss.qualcomm.com>
In-Reply-To: <20250811-sc7280-mdss-reset-v1-0-83ceff1d48de@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1116;
 i=bjorn.andersson@oss.qualcomm.com; h=from:subject:message-id;
 bh=iWKr94l4C+wGOu32iC4kUTBBxAFqi2csewiI06tugUg=;
 b=owEBgwJ8/ZANAwAIAQsfOT8Nma3FAcsmYgBomrDzaYgQuecT1vAEY3V2vVAU4NXEVxfTC/6Rd
 umxP8mPc2yJAkkEAAEIADMWIQQF3gPMXzXqTwlm1SULHzk/DZmtxQUCaJqw8xUcYW5kZXJzc29u
 QGtlcm5lbC5vcmcACgkQCx85Pw2ZrcUNdQ//Wo+tahejLl4GZM4AoSOTHfuxsT5do+dilLRbHjj
 rdlqhoxNSr6ugRG+IFq3m+xUg/cL17pSIt2PQggpfaBznLV3VgtOZPGLvmsJZ/3KVPPwRL1DR/t
 ckdcgUOkAD25rsyP3bnXRXl3aqXY0CUhlClw8+at9jnhamIcJRI5Mc9wNgNL8uy7zCA91xNNULs
 BkqUL2MSm308aA8f1Wj+zDdYysdI2NejeHe+0UqP491ef0a+vUz2qRDNnDd0a8QXk9HucIKv4R4
 peWyzOYP92ejK3pShm/s6xOi22trMjqeo1s0Xu570z0bRwQ84E65WG1CH5xQ9CHNW/bAtN8GFsb
 ur68QWvSlkA96KJqIjDEFm8t8QxbhsO2qK+NIgnsWXYaU5IhxhjCZp/BS6SYHCO2CmYFlPwthIs
 ZlsKDh6RTr6WTnv+8NRn0AGNxSZeZ/t50RzToI83E4PgXCEolh28d+aUg7KV95VDq3pDM7dCWuS
 SvJ3KeG21pUC7uYkwNaG61r+ESsGdrBd7kJiMeiRLtAIRFKabW8CUabwu2RK5hWZBQjNa6p2m3p
 rsGp53CmSxmGIvsxNWFVA2r9q7mB4qD4g+ckKg2AobCz9aFfHF+B8WK2Q8PSBkO67laYa+TlPTj
 fRepVQHRPrPKQs62ZvsXEfXmAJCGHZzmlGcj9EDTk6zg=
X-Developer-Key: i=bjorn.andersson@oss.qualcomm.com; a=openpgp;
 fpr=05DE03CC5F35EA4F0966D5250B1F393F0D99ADC5
X-Authority-Analysis: v=2.4 cv=bY5rUPPB c=1 sm=1 tr=0 ts=689ab0f8 cx=c_pps
 a=CWtnpBpaoqyeOyNyJ5EW7Q==:117 a=DaeiM5VmU20ml6RIjrOvYw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=dOedmflVD102KoYFdoYA:9
 a=QEXdDO2ut3YA:10 a=vh23qwtRXIYOdz9xvnmn:22
X-Proofpoint-GUID: VNnZ5g4AhmLwc9dEtLPhkH_MGRE7ix1F
X-Proofpoint-ORIG-GUID: VNnZ5g4AhmLwc9dEtLPhkH_MGRE7ix1F
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAwMCBTYWx0ZWRfX311gDbwMF1RA
 aY8lJNI8gOZTFT2mE+VVvhBfmnYzZDGVev3lRSojHsNTM8nQWoppWaSoMLcFC9VZ4hfbZEywKRl
 6Mo6Fkz2HD8pdlVA/gFsPdqSVVzO41hyOiXLHd5Sldf2OceFHCHrFERipF6u1vgHvWlHaEblQE+
 hzmgwBkMo21U0gmDfX+PpW1RF+AS8CFvkQpZ+KzIuwLQTcAzkf7vP9zasCgk2bor8vm1I74HPdp
 6f6zUZyR0rOmyzD20DPlwro8MjYb6xEwlsJX2FY1iexaU2P2QITLzOAeBaRfbZ6dMUQiI0ybTKO
 SnG5SXuWZ0qAgj3HVb2qg3GWndbP90IK0RT0agyR9AeaFKjZO8apydrZxJElLfkYyOKm3iE7nwB
 voGzpH6r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_01,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 bulkscore=0 impostorscore=0 priorityscore=1501
 spamscore=0 clxscore=1015 phishscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090000

Like on other platforms, if the OS does not support recovering the state
left by the bootloader it needs access to MDSS_CORE, so that it can
clear the MDSS configuration.

Until now it seems no version of the bootloaders have done so, but e.g.
the Particle Tachyon ships with a bootloader that does leave the display
in a state that results in a series of iommu faults.

So let's provide the reset, to allow the OS to clear that state.

Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sc7280.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index 64a2abd3010018e94eb50c534a509d6b4cf2473b..5eafcb84cd452ecc758922b69774837e9f5a899a 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -4724,6 +4724,8 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 
 			iommus = <&apps_smmu 0x900 0x402>;
 
+			resets = <&dispcc DISP_CC_MDSS_CORE_BCR>;
+
 			#address-cells = <2>;
 			#size-cells = <2>;
 			ranges;

-- 
2.49.0

