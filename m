Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3FBA1A9F96
	for <linux-clk@vger.kernel.org>; Mon, 16 Feb 2026 17:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771262049; cv=none; b=FJ9wCU3TGFBKlNYU9jwTvF7RVkOGHRlRHldRWVaHZpd6ihhVW/2j4nzE73Ws1YOVRlkz0NWJnkQMT9QN/GbGY+D0KzKnq4iWcpebj1cIdWboNg5bsNZvyF0z7E5HE2EPfbi5sVRw7K8KyXa6PqlyhsDi7MfeEIU6jXF6I44mMbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771262049; c=relaxed/simple;
	bh=DJfoagWYlcT7C9h6T8R8g2p5mRdkknDD4p0iI8EnbJs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ll1c5zYZ5dCElqqFQV5/b6UyH+/JBgN1OvRoJKRh4VOgu3bWxE6ZZTlb+vujih2Gc/I6FozGUOtsXY7g7PrIYrIMssv+b7mmvnxyx+UFW1RSDy99jO7yn52tMIgIi/O3X0UmrQxcSrI7MRvCm0tgWnuDn1yU1w3L0pA13A4wIk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JMvM+OHz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NpCC7xpo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JMvM+OHz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NpCC7xpo"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61GH4RMx985203
	for <linux-clk@vger.kernel.org>; Mon, 16 Feb 2026 17:14:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=8YzRM8u5SY+kbtvUuFO0hctv
	CD25XVo03kPlNPSNdN8=; b=JMvM+OHz5eRh4zvi+NHjLJ2YoYUuB0kacVQGHp9G
	t/ciwnM7uUIj2aKY5XoYRqQLDepRuwtWhQJ42txhfZicyWvZ6e4Mt15fjLrEgWc1
	u9FKbPfjrw6Ro8NsbQAiSTh2MLNxKjyBpdlal+wh+pNPa5vxOFT3HFudBbI5cOyP
	ea6EhDOJPQS3fcFjLmoT74OuUZgaSTSj0ss10HlLI11B/VpS9iFGm0vftlUJOv3j
	fCSldRd8cacdhgz8ffFrF8TcqyBsfmMuMpoFvk7qmbogJ/3J1zHQTLnwcKKTJTet
	cFtVQZDZjjssdkyWTBO2RnnRg7U+jhnsLD28v6M/3t5G3w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cc7ap00v5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 16 Feb 2026 17:14:05 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb3b6b37d8so1976514585a.3
        for <linux-clk@vger.kernel.org>; Mon, 16 Feb 2026 09:14:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771262045; x=1771866845; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8YzRM8u5SY+kbtvUuFO0hctvCD25XVo03kPlNPSNdN8=;
        b=NpCC7xpovC5NgXyBWL5BaR1Rjchnh8qnKy3qqS5xSk2zPBjqOpKHz7/45g5iSce5KZ
         +/pl13/7zpC8MoXYxygWgfpXT3Bl9muWCPP3DnSSpGnj1jgkPqZujb+77bwReON0K81t
         ncRZ86dUQgLI6Q6S2kmHB8YXNtQHn9jxRxxLArgbHyg/WhHvzx/ZTA83xngWzH0zAvVd
         Acvl34iQGTXNt7YT9X1cSEFq6yebksMUOs1I8/jFKqjXO7EkvpBz95LVWGlHOpYkOWMx
         wOu6o7lmlFaNuhTRKt2/l52IDbqIr9TqXZXbDEHVywFs1TVN0whM7LTJmVcOgbIWglso
         nrGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771262045; x=1771866845;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8YzRM8u5SY+kbtvUuFO0hctvCD25XVo03kPlNPSNdN8=;
        b=p0owgcuEQLI4IGpPginrDYeAAz3cEx041t+eWevRHxe1CeCR466lnVWTQssVdyMRl9
         8sYr7Zwj5wpWOil7jWAA1j0ixVGUINBte1TpXqiqy7uB7nbXmShJvGBrLKFEBXVpay2i
         aMPZ7ad8UwoUvwTiD5DJJmrq87PymGPUCzYMuk0M1tpN8R18vRJylF45mhdgr9vzcAm1
         aWdC8FtCW54RyH8s1HgEM1JOa3BULPnPd8433zhtBs/r+bXUqRTurI0x/FYYm8ybMYQX
         spUOpfFu66bvmQpB7lchH7CIg2Y7ZuPi/XQFt1T972NTKBaY3Kv0Mjh1S+lmvNTmco3p
         BNJA==
X-Forwarded-Encrypted: i=1; AJvYcCXKLPUe3KpR10NqXvAsy9TDXMz9nkiPUC1vZEpL4gzGQ1XpoLzhNDWJIcyNtfedGge/eadZS8ldoi0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwwJMQcRmcs+KAGNivnXrxsxOyfHpYIkycAM9HiJAB18G3QNPSb
	9NQWqPQObIcE4AUSMnQtsM7htpcDZ+tsJ/jgBIEXDFFxfYYEHShC5p7q+BEsmS8feFVoJYu1jpK
	2t/uJV1+Gdbuy0BzN3BZFCZZfHmKWmsquaqLr/P7WTVDiOo3RJ2kvFEZcF3wMLiw=
X-Gm-Gg: AZuq6aJUlr6xNWz9gCsfJIXTCM0wIEicZapRAVscQ68ZXptMl0vcLiAS6RCcRpm2T/G
	Onbj/vyO5CDujgCYPgQ19u6kA6QiBK71X/JwOruYXzwOiHNljkKeUmdrRMVh3hXjwU98oz3+9Z1
	u69LdLPEMM4pcetTbWGMdxAT0Dt19nG0f5DwGFHYMvt7nU6mkFtrukCuO+OJZFgWJVl5KMfkL0d
	xZWlRbkp1ZMeGBK+2p9gR0yua6cgzXnmCuQgn7gBvGt/QXc8FW0VJ30ru00SC6MohOUZzmFGeuk
	/uAbf33Wieskvh5X3EyCA/nfmrGP87PgUo1ry/KqGPvFJ6gIN+7XFnOmIC8+W1m0xN8RJmUsfdA
	FkFZAJFX3TL0rTOquPYYGlfgzXlMCxfI5P0v4
X-Received: by 2002:a05:620a:4706:b0:8b1:f1e4:a3d2 with SMTP id af79cd13be357-8cb4229c927mr1280896185a.24.1771262044903;
        Mon, 16 Feb 2026 09:14:04 -0800 (PST)
X-Received: by 2002:a05:620a:4706:b0:8b1:f1e4:a3d2 with SMTP id af79cd13be357-8cb4229c927mr1280891585a.24.1771262044384;
        Mon, 16 Feb 2026 09:14:04 -0800 (PST)
Received: from oss.qualcomm.com ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4834d482480sm496539185e9.0.2026.02.16.09.14.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 09:14:03 -0800 (PST)
Date: Mon, 16 Feb 2026 19:14:01 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v3 4/6] clk: qcom: rpmh: Add support for Eliza rpmh clocks
Message-ID: <3vn7er5thzwnly5kihzvpjboik5fm7jfotdvqspt6p73horbpk@67k6weab3ec4>
References: <20260216-eliza-clocks-v3-0-8afc5a7e3a98@oss.qualcomm.com>
 <20260216-eliza-clocks-v3-4-8afc5a7e3a98@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260216-eliza-clocks-v3-4-8afc5a7e3a98@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE2MDE0NyBTYWx0ZWRfX6ZqXcyryXm/p
 vR3n8nsEpQcJylPiLde9iVzaaUJUKvBesw0C5CFeSX5lit0HR8G8RUerALgTVgw710KSScSlK6C
 SqZ0GhaJ7hKo++LcUuppIYDxtm2PYuJbK42VxGNidhbUXgTEffb60tQ4PHH0jTbDVLEvDdZSK2Y
 ukJktzL2isC8kK1fxpqp7HgESGYc1nI9AWjDd1LHZps6y+wKL/D123v0CnBPzDHCAmIztSlT7SP
 tibyfap7gpG6fRbnoo3EXlFfE51CyFy9FDuq9jXuQoC10FsA7RC+6l4W3ePF8KwO/0VPXfLIQNn
 l7QbdBFlWNW5hmzWBmMabym1KSfmZ/FRO5IILScaO5CCMqm82CNSd6oaDWwf91z0HIdLs1GGfaH
 YUnh85nM5Trib5wtiqoX9oQHmOvwAHHkWDS7kiH0OvLqZfSzLG04KuAL4zEJAynCs1iQipZm/L8
 n4hQ6ARCmuDV4MGlPSg==
X-Proofpoint-ORIG-GUID: pMrLWdt6G3IPnQU1Q066cmcbkYgi04Cq
X-Proofpoint-GUID: pMrLWdt6G3IPnQU1Q066cmcbkYgi04Cq
X-Authority-Analysis: v=2.4 cv=Rfydyltv c=1 sm=1 tr=0 ts=6993505d cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=yZxmAL73Vz1KKP0sLwcA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-16_05,2026-02-16_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 clxscore=1015 phishscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602160147

On 26-02-16 15:43:06, Abel Vesa wrote:
> From: Taniya Das <taniya.das@oss.qualcomm.com>
> 
> Add the RPMH clocks present in Eliza SoC.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/clk-rpmh.c | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
> index 547729b1a8ee..cf46a6585174 100644
> --- a/drivers/clk/qcom/clk-rpmh.c
> +++ b/drivers/clk/qcom/clk-rpmh.c
> @@ -940,6 +940,25 @@ static const struct clk_rpmh_desc clk_rpmh_kaanapali = {
>  	.num_clks = ARRAY_SIZE(kaanapali_rpmh_clocks),
>  };
>  
> +static struct clk_hw *eliza_rpmh_clocks[] = {
> +	[RPMH_CXO_CLK]          = &clk_rpmh_bi_tcxo_div2.hw,
> +	[RPMH_CXO_CLK_A]        = &clk_rpmh_bi_tcxo_div2_ao.hw,
> +	[RPMH_LN_BB_CLK1]	= &clk_rpmh_clk6_a2.hw,
> +	[RPMH_LN_BB_CLK1_A]	= &clk_rpmh_clk6_a2_ao.hw,
> +	[RPMH_LN_BB_CLK3]	= &clk_rpmh_clk8_a2.hw,
> +	[RPMH_LN_BB_CLK3_A]	= &clk_rpmh_clk8_a2_ao.hw,
> +	[RPMH_RF_CLK1]		= &clk_rpmh_rf_clk1_a.hw,
> +	[RPMH_RF_CLK1_A]	= &clk_rpmh_rf_clk1_a_ao.hw,
> +	[RPMH_RF_CLK2]		= &clk_rpmh_rf_clk2_a.hw,
> +	[RPMH_RF_CLK2_A]	= &clk_rpmh_rf_clk2_a_ao.hw,
> +	[RPMH_IPA_CLK]		= &clk_rpmh_ipa.hw,

Actually, there seems to the rfclka4 and rfclka5 in cmd-db.

Will respin and add those.
