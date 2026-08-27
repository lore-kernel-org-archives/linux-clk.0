Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ACF34A33E6
	for <linux-clk@vger.kernel.org>; Thu, 27 Aug 2026 17:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787853116; cv=none; b=ogtf7r+0jVangKqR+UnT6IoiflMghvWDSMDMU19PpqpFX2dwF2bHMa4vtmcNunW2+ukBUSuszbenUqx+aEF6zGF0wTqBGaO5gkNk2WXTQm163Bg82ARXiG0DTCxQhxqjgq/yZmYAzel60l1r5SBmsLLNXO5n9d4yrxq6PXeBh/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787853116; c=relaxed/simple;
	bh=PwVD29DtUH4dIGkOMbXE9qMjiF+K6OUxLIjMJeof/6o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=T4WdgSOfIqplRkvyFMbexyhinLw8sGMWmzQndk+bFZfin7M2kivfOfW7Cl10NNPtNfdgKfl5vERHVRmyFaKeqAy+rsjRdsz1mI+hPmtEmOXS0O0gjj1C90M3y3O6N7jnIYzmGnYgjPbTz3AdPkR3x57aK0KdtqLNc47bcjy4I2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OrkbTqbq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Vqxf4+Q9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OrkbTqbq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Vqxf4+Q9"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67RHXav14178250
	for <linux-clk@vger.kernel.org>; Thu, 27 Aug 2026 17:51:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zPYfTHbFrfi2XEod5q3VXPMVscV9WPdiBhHDyk/uC10=; b=OrkbTqbqWLWzXeag
	Y6XXLkqEaCKKrZXZSJD6fFjtW+arBtUSejC8LlmqYkZGo1Frz97/GS1qSFnEmtLp
	YhrS3g+zXKYkgfs1iz7sBl3HodoWvnfSxpf3d3QydT3ID2gs/poLNXfgasgEgg10
	t+YK2IuDEzUmvUKW9QjXGbXwuvWLH3IeXv99ppVoX0J2C2ppS54vIS3+q3ZdVudY
	m0SKc4O5tMYH8nOyLYvthdbfXn9AbPA1yXp2B+SjKwFpFdAi0xOGqA3yl5XOTNYx
	Ci3O4TFE+r8M9WC7Ms4Byt5ElEsXMDCIoIeBuEyNX788p2kTP1/3bvUN36Zvjosg
	JgAG6g==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gaphw11yd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 27 Aug 2026 17:51:53 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2d63c16fc5bso1786705ad.1
        for <linux-clk@vger.kernel.org>; Thu, 27 Aug 2026 10:51:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787853112; x=1788457912; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zPYfTHbFrfi2XEod5q3VXPMVscV9WPdiBhHDyk/uC10=;
        b=Vqxf4+Q92MctupiPADBLZjeOED9mwvhAgX6482IhIK2+2jpKRSdusIL/uAL65lJWSe
         WC0E+B1MnRztc7g9iVuFg4AbmybXr7aUX5/kdNuoPidNOqM76MU+uq+ZWd8FCRa9Fh5o
         k+ItmAGImDDxTHuuuXVmiv4CzYSdHOHrkWeGCNbH9851+fQoVqWMeCaGry32QRDH940Q
         KzwudAX4Q7b/cSPDsAv1u8jKEd1L+deWyzNtQ9A15Aqlz1E3dGGT/HWdrwAal5tcdQfh
         iFbAI65bCf7Xe5Rrh2nHtjX4drIQWayWeZ11rrQH48Os4NnwlicgpMsMeIGzNpADIvdO
         PSIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787853112; x=1788457912;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zPYfTHbFrfi2XEod5q3VXPMVscV9WPdiBhHDyk/uC10=;
        b=EDhrXFrbgdVWs6cyH5P2uspFkBKWOWniT+VOAnaJjhsnjoZAb5j1E0/qSAh+FKWFjy
         mspSj6CdFvjNXqpTK09VkkAL4nxrHKSmsleFHE/ikoyDNWwONN3o7uU7/31+T7MIxnlE
         oHyuI87hACCfjjpWjiSzjTbTT5Pd7GSZTzkhJEBCOtlnZ2BaR7rqCcqqt1iCyX5a+TVs
         srw9nkFkA5Ulu/opFaMBu7fkpvuICkSq7YDzljET+2JBUYAaLJvGdHH9cvsBWtvL4IeQ
         b8nUZEvDd5V5KetAQ18GJpmLWCMjSEpDdEHKxnOAyAneCe+I9tqx9CcIGPMkJavQvE9L
         ym5Q==
X-Forwarded-Encrypted: i=1; AHgh+RpzadxNZ33iwfwRSFgGHlwg4x0bBuytIEXFSP3vifdxehBJnw3NynnF77vErFDXOLGgrRFyMzGjdZ8=@vger.kernel.org
X-Gm-Message-State: AFuF++muDTGF5oLryH0P4naBiV67MR7etG7OEl+WfOIijp+qdl7OHQ1o
	zgFEYSUheWhflcQVy6GwUWxzRw4IoAR9eNl3gm83Qu0YX5JFTeRCPq09tpl3scCoqyN/ENz0J8V
	qT6BnM9fakvrq9yKMTFl6whShy3Ocgueg006EhQR4Tqtj+NWfJ2Ou8pzHv0TmINM=
X-Gm-Gg: AR+sD101v9DFc1l1Vj3G5BTZ0RmA6vkL08ysvwHDtFXHWnrW8FXNpE2/jAFb+YiuPK4
	LVEINxSl9uUoom+uTP/H+rAefIl2maz0I+f5zE0FZCIGG17Lk9P04HYfNPriVXDjHkoGvOaHd1T
	BbCtHx0jM/r6D9tRCpGD1tjj6aedyHnnrchBYvYKKHXMPe6vN88SZzNbEV7cRU+0Cdn2mLnrpHO
	vKfWLAwyvlxE6hLjzq4qKdwmRYRcS2RQrqqAIDzTHLJ1/uUO+RmwDIkThh5Ggd5zjKVcfuIGJKE
	PTxXfTPsOXLhm0E0j67LCvE5RTiaavHp9VxMGlIZSdnh7EulSeK1OMopMXpkn8XQOVxVa6wMsl1
	YGxpMGu8lsNTeQMldhdwe+NyiAt4sM9zb1EYHBiPrGNXP3PWIU2p6d6luvWbTbnrgpayviDhhdG
	nKE/bEW8T+A3pYxv5uLXUbkWc=
X-Received: by 2002:a17:902:d588:b0:2d7:1e07:4859 with SMTP id d9443c01a7336-2d74dbe40e6mr13925465ad.2.1787853112477;
        Thu, 27 Aug 2026 10:51:52 -0700 (PDT)
X-Received: by 2002:a17:902:d588:b0:2d7:1e07:4859 with SMTP id d9443c01a7336-2d74dbe40e6mr13924515ad.2.1787853112019;
        Thu, 27 Aug 2026 10:51:52 -0700 (PDT)
Received: from hu-hardshar-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3283d60d25esm23889316eec.4.2026.08.27.10.51.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 10:51:51 -0700 (PDT)
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Date: Thu, 27 Aug 2026 23:21:07 +0530
Subject: [PATCH v5 04/15] dt-bindings: clock: qcom,rpmhcc: Add Kuno RPMh
 clock controller
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260827-kuno-soc-support-v5-4-6d47636a8f09@oss.qualcomm.com>
References: <20260827-kuno-soc-support-v5-0-6d47636a8f09@oss.qualcomm.com>
In-Reply-To: <20260827-kuno-soc-support-v5-0-6d47636a8f09@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787853069; l=902;
 i=hardeep.sharma@oss.qualcomm.com; s=20260204; h=from:subject:message-id;
 bh=PwVD29DtUH4dIGkOMbXE9qMjiF+K6OUxLIjMJeof/6o=;
 b=624VoE6RT/CK7yFN44c4vo43lHBpjAc7wHgne3hVVyn8wYeeopVl6LTMwJWZJuoDMQFApxSf7
 MCtWLZ/tVAvDZQGkWqsNg8O2BvuWsSs/K3ckjUs5KoziGaqjuojV5us
X-Developer-Key: i=hardeep.sharma@oss.qualcomm.com; a=ed25519;
 pk=IvwPDKA2xr6jWaCIBBY2ran/H0124QUzVfun+CtEikM=
X-Proofpoint-GUID: aCg7l3lSceVapiAEI-9WIfALfMG10xgI
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI3MDE1MSBTYWx0ZWRfX2dUCjI4YVSyU
 Myv0GVKmz13oNQ777m5Ixonjjavv1sJrkcNwr3ddR5QV9+AjDe6mDjTsC8TLt4ErkdagUO6VB7F
 /R7CWA9wxfBRZu38xJ4cIhW3+8xDdFE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI3MDE1MSBTYWx0ZWRfX4+ekJyQ0+Z+b
 0LuR5O1sZObcU56rC8bcNPx06F27Czzk69094ntddmiAnR0W0jIWj0rhUu3sm+SlPhSGPq/ZeND
 Ty1/z1/7wLXp9ov+wCR6J0PfPEESjGUEAAeVTG6BjUpVz+1MjkVWD+Q2Ru6RsBL4Rq9E9NhpYT/
 WF7I6QutyZ6vCg+153W3Yq8KnaMNl1vjefJNtrm+wr8t4m+Zu2OR3a6JkM0DpIoTPT1n5mMHHtS
 cMBpq9FeFzsEK7RCq2q+B8vVQLm+Ewg8yDwEq/CosZ0ohL8mdl92HGL09ZO/ZcahjVkScg8LoA2
 GK7leyuiRYm4d/pkICo2+oUKbxO+L7vfTmhicAUgD71FWfSrlwRUhwoH6+CyefM5D+HdGMLdEtT
 Wr7IwXV/kUBmFqz7SPw/VlTgky3xntu2JlXOohUcN89vS+FRVjDKUkYirupQfx3fxXgnB4l+ECk
 8/21wxkgKlbqtNYt09Q==
X-Proofpoint-ORIG-GUID: aCg7l3lSceVapiAEI-9WIfALfMG10xgI
X-Authority-Analysis: v=2.4 cv=E8b9Y6dl c=1 sm=1 tr=0 ts=6a907939 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=VE4QQHX-7aIn0oL__EwA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-27_07,2026-08-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 adultscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608270151

Document the RPMh clock controller compatible for the Qualcomm Kuno SoC.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
index 2b446aca5207..9d521ac9c33f 100644
--- a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
@@ -22,6 +22,7 @@ properties:
           - qcom,glymur-rpmh-clk
           - qcom,hawi-rpmh-clk
           - qcom,kaanapali-rpmh-clk
+          - qcom,kuno-rpmh-clk
           - qcom,milos-rpmh-clk
           - qcom,nord-rpmh-clk
           - qcom,qcs615-rpmh-clk

-- 
2.43.0

