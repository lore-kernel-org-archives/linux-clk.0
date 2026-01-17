Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BAB121ABD0
	for <linux-clk@vger.kernel.org>; Sat, 17 Jan 2026 20:11:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768680678; cv=none; b=JCeFeh7sahm9vgbkBYsqvq9xvuwVGw4LdMVE0B7CtzLPK2JK1mJlfjKNMPnzhG0VU9p9hI6jkd07eeCkFJ1Z8SjThl63AJaqD8VtlIRxSXKXCn60N5Ul03ese+8dFBIrvJXrxeBRdeypMdKGvqDNIFg6WtIhyM9F37qPJDC6GyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768680678; c=relaxed/simple;
	bh=xYUB2VUQb0Sc8Sj+Eo/ZFpkiP75CO3KSWxGTkgyvN+Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WkbAlGOnMpnsuy1NxKI1bEsvY4/dYrZBm7ivXYriUbUjhXLksP/ZxPGCbAkMkimAvr9G2vJjsYOBzLbZd2SmibuRnkK5Iv8X1ORivjCf+6pVRRwSNflHoCY5SLoCjqX1+bQBRUC2UElvELc3zD8HGh5bY4kJtqc4AeRe8h97lQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fVhhSOv5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RwwK/LMK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fVhhSOv5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RwwK/LMK"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60H2pmRI2151681
	for <linux-clk@vger.kernel.org>; Sat, 17 Jan 2026 20:11:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ujKSyEbbhm5nCRZUQ4cnSVXm
	CMUReNgv+yj8//WkZoU=; b=fVhhSOv5Lx2fhXt2xSaWb4me6DFUQerANOtb6tVe
	+MHge8CJ1m8AJHhSaTaYdIThsosEDc6iNBysdTAs6ETvzVVHwh/e74a6TK2mjpQ3
	ZYZaNG3U3H+howdqAJEuHOJ+fbT4RMToSDRJq7DA8mfz8K1nFX4IW/T6m8zctdJy
	bcrncAKcufXaPapAJj/asNQmTMitEfJoL7PiilPzdYANnZQ0KVpPdbfF6LEdP4JO
	rHNcgqpLRgp1h1JepWOYXWPyCyM1/WGGDQa9Ie0imnGh7t24q8DwqPJjNPTGFkGR
	yXsgLzA0C6i8uhaE6JLCVisNRFRHFEE3tUhAOeEp1xhTWA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4br20x1fb1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Sat, 17 Jan 2026 20:11:16 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c6a341ac9fso511202885a.3
        for <linux-clk@vger.kernel.org>; Sat, 17 Jan 2026 12:11:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768680675; x=1769285475; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ujKSyEbbhm5nCRZUQ4cnSVXmCMUReNgv+yj8//WkZoU=;
        b=RwwK/LMK1bRk3bPcOPiefortUCv8MFJeJ2Zzd+S3dcFuXUZCc2bPVdsHmGWsl7dLSe
         ADDFnhVCN20pMhlejyNdY1OR6HvwyAylbKlMbdPJc7zaeYQSF16r2VsJuUu3iur2fteT
         LYuaSkDD5ByhyauqGihs8ke/tmmM/FkKWl1nuxvEzwq6TJG2bWs6oOaYoBnKn6w+EKpv
         cq2uRHvg30ABj1QZvmnFbfHo5Sy7BaR0+5W+WLEP+90K+bQ3lwtmQmVfpkQ2QIumTTGb
         VMvRpztKJF9gPXeR2XmGDm2cC3RVW9NKz8sSrVexsmb5bojznxUF06lmWCrRsOoVV19P
         hMPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768680675; x=1769285475;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ujKSyEbbhm5nCRZUQ4cnSVXmCMUReNgv+yj8//WkZoU=;
        b=Un0UTyKaximc7mOaizkI+Q9Xt7mNoT0gC9JLAsSGCBs3YMJxVlrWTHMr5DbrEytwHe
         yO87epDzfz+S4Ll+J+BpuQ31f5oJ5X5QgvcgasP+gX1N+x3oa9s4uOcTLXf+cnp2UjqI
         9pNEOWeYYGUeVjcgzrHd5GDepT93NIJ7YPlKXdZ3wzQY2ccFE+Lb6hx9fjX5gJKqHSNq
         TdxX6VRJNbz/NcJ9Wsyk+C8kbTx2WS8GnvK8+3ouRVG+iArs4m4paoRUhiU+o4MSlDSO
         wsy6uKC0Oa75qAJy5riCXp5+DiLFrx/WsV/ZGk7YQBhQkDnK9IDDDK5/F8kuZkd1DAfU
         2PXQ==
X-Forwarded-Encrypted: i=1; AJvYcCUZpGDOj/a+4tl1O74sBzsVpvFFb6Zi7E2vi48VIJ6joxaf1nSqCv8M7t1jnoHXHO4PikTL9eJiSXE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzRyY/DGxDUi41qseViAGhQaNGrbPQJ2l38egJFAD2sc1ZK/GDq
	ZesOCx2mr8wj1Q/zC9wQgxEzEn/ixcuk1mcYy4/B6/rTyjG6zmQHenKlWXUcu6zCxtnc8WQHrxO
	1lz1E82p8u3fXGQwkXrIpEZuppQCD77oJ3iiOlgM1DHosWEN/h2bgMX/dBpBoJH4=
X-Gm-Gg: AY/fxX7C+qbVPfhbmncKi/sNrv7uTj9ZKlPz0ntWKNgQ/jFJK695e7qam3Zz+qRFrRf
	S2znl9ATzTZsQx1cON7X6WoF+yNtmGKcFVN5xfMCCQQXKscNehndXl7pB4UtGMaI1hsQ+sTZFP7
	lg5wwppwPxkTaKGc/jdnA/zG4PljnJ3BdO+wPgQV+rxLGBA0qV+q5n3MUYamLHAv24bUtpHAtCH
	SMwDFiUnWPg/T9SFf5uvLx81NaCiIH+/MIFF1rP78bOf/ufNtq0mBoJzXaBlt1sNxVVbVsa2Bfq
	Zbo1Mk9W54TI8Y4dEupnnJO0WpWHKRoOMrvsN93WB8o39rbe0+SI/QNH0uNBXh3WdIz56+jvpu/
	CtXF+3nrLSShMiLsL+F2eLZ2y
X-Received: by 2002:a05:620a:290f:b0:8a1:b5ab:bbd6 with SMTP id af79cd13be357-8c6a678d1c5mr1037442185a.71.1768680675428;
        Sat, 17 Jan 2026 12:11:15 -0800 (PST)
X-Received: by 2002:a05:620a:290f:b0:8a1:b5ab:bbd6 with SMTP id af79cd13be357-8c6a678d1c5mr1037438085a.71.1768680674879;
        Sat, 17 Jan 2026 12:11:14 -0800 (PST)
Received: from oss.qualcomm.com ([86.121.163.152])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47f42907141sm164657495e9.9.2026.01.17.12.11.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Jan 2026 12:11:14 -0800 (PST)
Date: Sat, 17 Jan 2026 22:11:11 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, linux-clk@vger.kernel.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Primoz Fiser <primoz.fiser@norik.com>
Subject: Re: [PATCH v3 1/2] clk: imx: fracn-gppll: Add 332.60 MHz Support
Message-ID: <3wfaqupyiynig5fx6uuo3jhole6f4hxwmaetcmq4sk4j3w5a7r@qxyrms524sl7>
References: <20260113-v6-18-topic-clk-fracn-gppll-v3-0-45da70f43c98@pengutronix.de>
 <20260113-v6-18-topic-clk-fracn-gppll-v3-1-45da70f43c98@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260113-v6-18-topic-clk-fracn-gppll-v3-1-45da70f43c98@pengutronix.de>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE3MDE3MSBTYWx0ZWRfX5Lc/HEJCrymc
 547e+42RvKUxG4dHyohI2LNpy5vuk67tv4AtdSZmpr1DhXi0oOTXqKuO+T7uknR+xhfqBjldiPv
 Wzlv6i6x7R08CIHSohEL5jFJisIamZXpewRZJu5mpJE2tMekpOdoJHNK4Dnkk67sWpuoQUvSTM3
 8zN9+hclz1C5dudJpgEA7j7GBPyoinLhVAzfGtUCf9WMYwOgj0IRDRA44HyAVcDstIXBniTff5z
 B+NXdUn5d59mS5IkXbaHf8TFMLcSTOcaPL+2+6K7wfwa1Xdt1++KtCX5kJKCWXqH3dNj5Ja4pJ8
 32XXT8Ii/VUKVmH8UQPedcfhca5JpFTYtdn2S8l8D/u/BxDtrYGAzd2gTkWZBosBo4OPA4zSGW0
 lAY7CglBa8FBDsZ23AbRqSiQcJvwIIA/JnZGr08Z/7IVHjZSoBxYWE/+i4IfA8xLf8947/YkoTu
 vl6s0GG4WB3gwF2Bgfw==
X-Proofpoint-ORIG-GUID: q4lyii18QLFRFOo4zuk-Zgw21XfgwJ9-
X-Proofpoint-GUID: q4lyii18QLFRFOo4zuk-Zgw21XfgwJ9-
X-Authority-Analysis: v=2.4 cv=abRsXBot c=1 sm=1 tr=0 ts=696bece4 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=RUlelSpolvTNyr7Sls5SJA==:17
 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=xkLUNt4dAAAA:8 a=EUspDBNiAAAA:8
 a=aW4Cx1oNOFiDtan71kAA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=A2EApc-QTtVVSfvlwUcc:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-17_03,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601170171

On 26-01-13 15:52:41, Marco Felsch wrote:
> Some parallel panels have a pixelclk of 33.260 MHz. Add support for
> 332.60 MHz so a by 10 divider can be used to derive the exact pixelclk.
> 
> Reviewed-by: Primoz Fiser <primoz.fiser@norik.com>
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
