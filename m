Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C434839A801
	for <linux-clk@vger.kernel.org>; Mon, 22 Jun 2026 12:13:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782130410; cv=none; b=IdJzpJmnvOxCjWeEU9bXPZ+otVHf0TjRN+mItadf0njj9+GzGaskzB14KNjNZ337wzAAweOmLmo5Zhf6Uv5mXKFkTWVokM92MM13N4ATvtLqHbJWlgCNtOEvM3Ny7B68OkZ4AdmhwPKC2x1zJ7wrHPJ1Kvus3ncg0Ao8r9kmvtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782130410; c=relaxed/simple;
	bh=qQLoam/1MFwItn0Qqrv6nrGWj1C65+jczm2tdEcPZWE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s4Mt7vV0EURnXOFmdLdveA6ufWph0JrUMCXTc3ciOyvd/CtyLlIgfiyUqgzGg+2wXuL3WzZAFXM5eWIFo0gZe8JEcrSwGXnPp3jB9sKCAq84OOGNxBJzv5tnXYlMSbigm7CZTYRpVSCu+RUe9TvIhwZkVQ7jsndosqK44r5dHo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UVg0mv6X; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h392uK5j; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UVg0mv6X";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h392uK5j"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65MAocu2740784
	for <linux-clk@vger.kernel.org>; Mon, 22 Jun 2026 12:13:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	u2M7Jat8m/iRJnDPYk9e2Jat/6YABPDmbkZh0pcpP3g=; b=UVg0mv6X9Ox42QGo
	Q0iNAo9uOpchQWUIBAiC6A1z4KOoHvAO/HklptGXNg+vmn2g8Jb9L8i9kHbFeetU
	TdRUZetdfqspUFP+sPY/gmBa+9M6369igOdeqq08CaGqc3TqRDMz+7gOI+f8h2j3
	MFA+rhpGoNBucNBku3RGB0LcAlut5zIgVBGb0arEzi1V7qYOrI+fAFCuMnsIBnaZ
	6gPM+0kzHapokqaWZUQvcOVXEaAX8QOyzMU4DTSGoqYBcgVIhw0gQOboeUbha60Q
	1eQWlT6tpWuMl6A2ZHP03UQILJ2s+v57u04I2KTcsh89jpfLkCnFH1t7hTODA/nm
	j8MJpQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4exyn1sdtk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 22 Jun 2026 12:13:27 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-517bdeceb54so6938281cf.2
        for <linux-clk@vger.kernel.org>; Mon, 22 Jun 2026 05:13:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782130407; x=1782735207; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=u2M7Jat8m/iRJnDPYk9e2Jat/6YABPDmbkZh0pcpP3g=;
        b=h392uK5jBpBViTzAnj7TXHzF/sa7YdJikyzSlTzYu1GdmuTpA3US5XAw0pGy3k0MFU
         9Aab4D5j7beBuHfbPeZH61tJOQNxO+fWPwY57J5UjIrayuhHumxk8x5/P/7opqqJM9i9
         vEqUXJkJjqjXq3sRQMYxgr72TxkDrCMSCvEDNop4U1lh+ZwV9UNXIH+ZYf4mW7Lzo82E
         UjMDAvc9O/AUpCg9BHaZlgF02PrxRnctUx6qX/lJmDy2mSwtHOKSiAlI5kQJ9ruCP++4
         XUsntsXVoJaymyqB5bHv653GJ5JzEqkd6c6E7WsblVyaECBNNdGXJCo4rWG5+7/ahX+L
         pwVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782130407; x=1782735207;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u2M7Jat8m/iRJnDPYk9e2Jat/6YABPDmbkZh0pcpP3g=;
        b=D/hUKodmC6GCSZq2b56lq1GppksZ3RL1AESBM2/WhKbAK3dJAIqUr0idwvEAhPof3E
         7eovauDs/lm/zD3RGCtB/WmH4GagUs8+8n5ENtd7vVURvp/0iClZDa7Dd6SjA+R05t8M
         w+mZBC6hNqFM5ndg3rKLYo1SGkOzestQHRLwluiAegH8zugmWLY7cjyJ6goykbo5BeFS
         7qSzN59GDNt2lsFn25/RMY/clfatbkOI7TAc+CI1RwgTb36tscZ1IIfDZm1VUojN0gfF
         7LXtiJi52Jb2omMTaDL97TaFv59BLKuukLjf6fw5CX5c4xAD96+d9TkzkYUJJoTXUyud
         joGQ==
X-Forwarded-Encrypted: i=1; AFNElJ+lhk4wUPghtuQXcRIyEykQeLY8mAncJY8y6i4ckT5bZQ/ZV/A58J8Wtz0zDeBMHpPRk+B6lWd4BCI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxKVby0bjcszWD5ndXKxsQZ5XWNer0dA56OjM5307Klo2jAd1cV
	jOY5U/1sx7Pp4VfUA2T35S5u4wYihaL1blgScx6bKYCzEqhJBqYDpAAxMaK7itpNCGVskK4ocLa
	mP79EamMqOsYyflC88Uv2+Hs7aBYcRloDBT0mFawshRp3U0UynJPlmeaEOaEIqfQ=
X-Gm-Gg: AfdE7cm0hBHAC/NRafBo1DvkhPoWoAJwfqiEoG9OINZhRhZnNsEFN1aFZNKS3emzfaZ
	Gq8gOc31iGY2QrOMo0x9hFTfBDaAmOeWONdG62JVvNaI51dtwaQwA8InwO8bCg9/Km/TyHQkDmL
	/cepcj8eiZ7aiR4QgoeLjuTIzw562k0vfsUPmFHsW/IO2Vc6K38BqeBJHrSq8/Qpv+AIKoGkn5T
	BrHS+dTvhDA6XXLhtISrfF/sWafcYj38izuoXLDI4b3GVMUA7RlrAV8CJ7ZFa3ZdTV+buCfdai4
	o+1Q8tabSavbl7eLMCbnauASrJXyCwRoN1dMV1mXH5WQec7+8L5B1fLw5fcbWpcv6m4piQJFnzz
	+BLYC6UrE6mGA61LtqIokJdi6PsFNhvUEOC4=
X-Received: by 2002:a05:622a:313:b0:517:8999:6c50 with SMTP id d75a77b69052e-51a21b67438mr63115101cf.8.1782130406937;
        Mon, 22 Jun 2026 05:13:26 -0700 (PDT)
X-Received: by 2002:a05:622a:313:b0:517:8999:6c50 with SMTP id d75a77b69052e-51a21b67438mr63114631cf.8.1782130406230;
        Mon, 22 Jun 2026 05:13:26 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad5c26eda9sm1621597e87.24.2026.06.22.05.13.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jun 2026 05:13:25 -0700 (PDT)
Message-ID: <032d6002-2205-431a-abc7-7c0a010c9897@oss.qualcomm.com>
Date: Mon, 22 Jun 2026 14:13:22 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/8] clk: qcom: Add generic clkref_en support
To: Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das
 <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        krishna.chundru@oss.qualcomm.com
References: <20260621-tcsr_qref_0622-v6-0-c939c22ded0c@oss.qualcomm.com>
 <20260621-tcsr_qref_0622-v6-3-c939c22ded0c@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260621-tcsr_qref_0622-v6-3-c939c22ded0c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 0aKMFUJFK8yYfdfijKjls89_KxeTAlSB
X-Authority-Analysis: v=2.4 cv=EOU2FVZC c=1 sm=1 tr=0 ts=6a3926e7 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=tIU0ZN1R_etRVKZmDSAA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDEyMCBTYWx0ZWRfX02ZeSwa645/F
 Ijzwd9yU6Ej57vPp8ZcDbxlTNMeftXMSe+0Dpkc1fOJhXmL9LAXbjfCFJsqFbLXBfJeWxy0Guvp
 7kwVLh2qpiQcJxT6nTolccL21Lk+uro=
X-Proofpoint-ORIG-GUID: 0aKMFUJFK8yYfdfijKjls89_KxeTAlSB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDEyMCBTYWx0ZWRfX6m6nk1Ssh2Vh
 2WDiZt2pI06CcBJezMqaKKlW7ZCA8N1fPknpXqmqTUgsun4bzlBu0FqUSLesoZxaG8gQ6Jyp4ps
 Xq66l8Sg7AAG14T5Kj5Y2gVKUN/qYZWaqEJnYPkXkOyw/ldYwNvO8yhtBjIVb4N3zy3Do/s4DUd
 70CzAIwGZhepvctcjQAWIZpZ9Fg6qgy5F8nhZRCZJVpLiaKA/YxbTnx4yK8XP3Qs4DLrobvVQJU
 D2fjEo9JHbQKlZPksGsl7Z5ibFC5jfmpY6+4KEvPyeCh/lOLlza4JBqqWXYguxEOjPF3i76/npX
 oaQ3qF9QZsA3A4gp+e5LCN0seAlfCsvSBqxNbfCvWJpqg0bIg64qQVCQMMA/70hPx60bArZXjZz
 L2QdCGZAj1l1XsydGeTPqwcDkL5PRy+zFjPogdgg44W0d8MrOJmLGL39faMRJvEuszIQ/Ylxntc
 Xl4PmiSnHX2Z+z/WLug==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-22_02,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606220120

On 6/22/26 7:11 AM, Qiang Yu wrote:
> Before XO refclk is distributed to PCIe/USB/eDP PHYs, it passes through
> a QREF block. QREF is powered by dedicated LDO rails, and the clkref_en
> register controls whether refclk is gated through to the PHY side.
> 
> These clkref controls are different from typical GCC branch clocks:
> - only a single enable bit is present, without branch-style config bits
> - regulators must be voted before enable and unvoted after disable
> 
> Model this as a dedicated clk_ref clock type with custom clk_ops instead
> of reusing struct clk_branch semantics.
> 
> Also provide a common registration/probe API so the same clkref model
> can be reused regardless of where clkref_en registers are placed, e.g.
> TCSR on glymur and TLMM on SM8750.
> 
> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> ---

[...]

> +	for (clk_idx = 0; clk_idx < num_clk_refs; clk_idx++) {
> +		clk_ref = &clk_refs[clk_idx];
> +		desc = &descs[clk_idx];
> +
> +		if (!desc->name)
> +			continue;

Carrying over from the previous discussion:

> // this allows "holes" in dt-bindings for $reasons
> if (!desc)
> 	continue;
> 
> // this makes sure the programmer did not omit something important
> // while not taking the entire system down
> if (WARN_ON(!desc->name)
> 	continue;
>
The NULL name check is intentional - the descriptor array is indexed by
clock ID, and mahua has fewer clocks than glymur, leaving holes at
certain indices. So this is expected at runtime. WARN_ON would be noise
log here.


->

Your worry is captured by nullchecking `desc` (i.e. descs[clk_idx])

because in the mahua case we've got (ephemeral indices)

tcsr_cc_mahua_clk_descs[] = {
	[0] = { foo },
	// [1] is unassigned - OK
	[2] = { bar },
};

while (!desc->name) checks for:

tcsr_cc_mahua_clk_descs[] = {
	[0] = { .name = "foo", .offset = 0x10 },
	// name is NULL by virtue of partial struct initialization
	[1] = { .offset = 0x20 },
};

however I overlooked that we actually just have a normal array of
structs.. if we turn it into a struct pointer array with assigmnents
like:

[TCSR_EDP_CLKREF_EN] = &(const struct qcom_clk_ref_desc) {
	.name = "foo",
	...
};

we can achieve that

Konrad
