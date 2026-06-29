Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 709AA37C11B
	for <linux-clk@vger.kernel.org>; Mon, 29 Jun 2026 04:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782707937; cv=none; b=I3Qsh9NNN6yAdnNb8286ufj02bpW//CpBbR9doAKU2zu8p1ZtG3ZDMfWkp9JnYvrJFNepHS+GUpPgWCaJmCH30v09Zc234pjA485z+jYxavRy+4RZzaswGCn6CoMJRQY0zQX13eCLvonh9SxhtZVys2dmruQLHk51G0SRakZo2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782707937; c=relaxed/simple;
	bh=6XedRWs0tAdQLU+ENS+Cwbaw+CbvhGUee8wliZmU0xs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Cu59tL38rppY4ZkJ52O8XyW3XuKoFAXzNx5IyOrgAAYO77hL7EzAIdUIJsvdZs8gOM9F8C++zqRgaLnlKyRVAe8nhTR309dFVtYBqsfARie5AyBHNkRiHwnRjudjtQrTeRkwsaJ26XfPyC3NGTU+tyvMgL7ckrFERsmQvwaZX8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YMBDETHg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aVHY7mUj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YMBDETHg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aVHY7mUj"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T4NE9o1718897
	for <linux-clk@vger.kernel.org>; Mon, 29 Jun 2026 04:38:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rgU/Z7dK7belqgrWLmJtB2Jz951aedZsprBN+xIAdsA=; b=YMBDETHgScnJD64z
	7VjJ0jJEx12BuwogcwIhsc3QfJvf6QMFB8DaeGp6HnRGFQ6Iss7BKEv49t/BylUa
	8vscXZ96OwJ8QnNvnYDY77c1vi6UEzmn7kSDJXqozb/mo4GjifEv2v23iH8vc1yu
	g7fgYWXXJ1SFzFFQ1rw+U7knli9SNQPQMZGGMW03jNscwEF7mSW1LfzZWgL9PrK3
	N2KAxmfV8vTAqRvHoAHnpgr8CWfugforPpXvUPFTY0KjPCjZMOXntkh14FfHyf1O
	bSzk5w9gjxQ1oBqWzNP05p2Zew/y6j396cSQOYowK7V8fct5Bw3RqTSg+rRbGP6+
	UG/KOg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f27pf4as7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 29 Jun 2026 04:38:55 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30c0d568830so13530778eec.1
        for <linux-clk@vger.kernel.org>; Sun, 28 Jun 2026 21:38:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782707935; x=1783312735; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rgU/Z7dK7belqgrWLmJtB2Jz951aedZsprBN+xIAdsA=;
        b=aVHY7mUjIzVVQ/Uk5X4/cicp7bA5Uj9uE5QnRdIdV74EfSWLp68Keb2fH9TreDLxIB
         i0AF+uMnnzAMguZvx8YGoQadZnpVphHYUWNckwbUPfWmaVhHFYF/wtWcqO0nYikE9V2f
         UGuO/kPAy0z3TgEFqsrJj79CeMHDZaurVZsG7G5xueqKpyZ/8bG9sUgDeh1sC/3i9ZzR
         zOuGWc+Mxrio3oBpDFX09HA0Bt0ddM2Etd1nN83qRgX+M8UxB/BRORPigLZ2BV4CzniB
         ZyvIJkfJZhJnkh28bvfxcUPVNEz+kaTZRUpJJceZH+O8dEm83gZaBbNlPCb/PaAUBuI4
         YNNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782707935; x=1783312735;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rgU/Z7dK7belqgrWLmJtB2Jz951aedZsprBN+xIAdsA=;
        b=nth5zs6C+lgEEEnbeiun/vzVaKKaaolMCH0M9eUQceCvu9jRCeB98kH1qAkzaCyh4z
         tXzDJO+MFP0UhQws8g/tTGGf3lDpi8B7AIIeQ92iyXYvSFZyW/cQJboELr38ZRPzbj6m
         Uqg2mrUn0SOp7kujWaRo//fHYJmZ5isRDEuwWCrbt9yhxfeHszHFl8Y9G6GVUdn+5d6O
         KVNBp8TnmAhiLm3Be7LJrIU7tXgG4uMIz28o5yj/+e24pD4MNhCZSj/yUoqwqcZgzdNv
         wzXWW3ZZudnsUc9mxvQBFmVr+fFaQ0hi9cCKd5cPn2eSD8Fb2cN5CpJRIGU1wu2WNiZW
         784A==
X-Forwarded-Encrypted: i=1; AFNElJ/vo4xJ+Eqjjelyd9opYkCmzMMfzyFS9SpwrqJ7xEBCdChsKCdPyI7Brr0I0pCvDoMpd8pRuxbNJ6g=@vger.kernel.org
X-Gm-Message-State: AOJu0YyxiURbzbSQNjeSNV5NS/Owx+tQqJKuAStESVnNeLXmSiEA7Uws
	FkehlJTW05XjMQedhW97yUavMaxOBxhaFRFd+zlbn0ebLkA8a6BNDbNyc4+KAxlCdl/Xic7n1dn
	0ryMedKn5+2PCmPSbDxP7A6whk4iBujwxNcu9TF8rH5bo46VNrQ6lRhVvs1k3jsaEsgz0LW8=
X-Gm-Gg: AfdE7cmeU3F8b19ZH3D7Y2vELQkmytnrhvBF1gJNoj58BUHkwhb/In7XLaixxGVzF7g
	ta4cgO1dINb9JMvaIc4zh38DXH/E3eZOOiR+w5YlMLpZuVnwKfOsF3M9zXbmkFTZZ/AF1Q8vCnz
	HauQHvt3sQV0iXEzkstFfzoWXwLXkpGeF10IaL2c5WoZFqBfAHMEJWX+mLbtZKkS6PFBrmYYMDP
	he4Xyg2vRTXuWphU5dec9pOS4Dqu0x+cfrwGtBPxxBjcHoJ9W+Tv2tGm5heeAAkz7+Chd13KZZ7
	JiA7xAPwN1ZjIGUoT8jtFcVxk7HHoRm2CNTPJvTSJU5CRS0DJQc6kNR/SaYOYMpOXozzO/uUjgx
	TNmrannznfG36OwHBjdwIIcgVh1kDYwIGar5L0Cc9+EEiLBMyB2r35tzvVEo7twgu0bCagXxQA8
	cgNUiJWz4QKioAKcTg99DlX1t+mNvqhkvEtm6ZuJ/B
X-Received: by 2002:a05:7022:629b:b0:139:b63c:a0f2 with SMTP id a92af1059eb24-139dbb8bdb6mr11102670c88.33.1782707934495;
        Sun, 28 Jun 2026 21:38:54 -0700 (PDT)
X-Received: by 2002:a05:7022:629b:b0:139:b63c:a0f2 with SMTP id a92af1059eb24-139dbb8bdb6mr11102650c88.33.1782707933949;
        Sun, 28 Jun 2026 21:38:53 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-139fcf63021sm7791247c88.0.2026.06.28.21.38.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 21:38:53 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 10:08:42 +0530
Subject: [PATCH 1/2] dt-bindings: clock: qcom,a53pll: Add IPQ5210
 compatible
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-apss-clk-v1-1-8c92fe118ce4@oss.qualcomm.com>
References: <20260629-apss-clk-v1-0-8c92fe118ce4@oss.qualcomm.com>
In-Reply-To: <20260629-apss-clk-v1-0-8c92fe118ce4@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDAzNyBTYWx0ZWRfXxD6KY8tsBKPs
 U+A02X56/0VNfMPLelR8TbwYqZEJHuPFv/cEeQmshBhA0YZG8d5mNj3Boh0Zx+t2t24RvEjQoAn
 p82cepBTpUFhhhaYtdIlwd2WTnsaQTA=
X-Proofpoint-GUID: 1QpsRV52Yk4IrFeKcqEPnJnDWyiGjQqW
X-Proofpoint-ORIG-GUID: 1QpsRV52Yk4IrFeKcqEPnJnDWyiGjQqW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDAzNyBTYWx0ZWRfX6niUvjyt7OJm
 T2/JBBhPOzDw3KHKoJkA31L3UiKfl+b2B4Rog3l7VMg26k2lIjUnwVtpP31mWXWAnAvZLei3hsa
 ZOWv3dQkHsH2tQA35SxyVWEw9kl7l2yCqSSRrYq/XtogSgjo+8BzCi9IXJYtpPISN486TpGrDMJ
 /lPVFcFqXtLFIcxSZtbhprBajmNGb1889c842dPOeE/WgMmboosDQ9RRnBEOwNYgf6oHIS4fDOQ
 U8i//bneWoN/J2O/LmXwXs+QAF+MT1LX8NA1xHcclB8nCL7MgdgQUz48OhYIdzO3UJGCB2oO8tW
 cbRjkHMmD0NuU7fDyCBQsYgPuhY+SlwdtWTisiEkAc0Yq+iHXe/l5teimDPhynAdO7t3Gn2fLJL
 EeydWLo+0nUgToBXPSO6m9AimRsD/BLJKCmvJ9bdck5ssRXVaR7YR7hAJR7xOWyp/rWuCb2Czs3
 mEznyI6iJmgAUYsdCXA==
X-Authority-Analysis: v=2.4 cv=R7Mz39RX c=1 sm=1 tr=0 ts=6a41f6df cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=5uBAxpE-56c2IjUQXdsA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290037

Add the qcom,ipq5210-a53pll compatible for the A53 PLL found on IPQ5210
SoCs.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/clock/qcom,a53pll.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,a53pll.yaml b/Documentation/devicetree/bindings/clock/qcom,a53pll.yaml
index 47ceab641a4c..1eec77e75a0a 100644
--- a/Documentation/devicetree/bindings/clock/qcom,a53pll.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,a53pll.yaml
@@ -17,6 +17,7 @@ properties:
   compatible:
     enum:
       - qcom,ipq5018-a53pll
+      - qcom,ipq5210-a53pll
       - qcom,ipq5332-a53pll
       - qcom,ipq6018-a53pll
       - qcom,ipq8074-a53pll

-- 
2.34.1

