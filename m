Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795468178;
	b=STAi0EiaDyopU0vLYBbNv9nklr9ivKXg8PgVAd0MerE2BmZoTiYqnrkJn+JaBsRCd5dx
	 v9Edb5s43qL5XoS4tRN4h6rClmag1zqmKPCRW+Zrl9aFwL3Kz6l9SNyMLZwJkJtPc/9bT
	 qZlKMRyw7U5MchblTILHddAX1IN/NshRaR46kkCYeCHZA/ZJMqokC3/G4f/uWdcPGgqwK
	 XcBGs2j8AeIJLemYzyu7pNv19W5VSHhvqkdRxTDzRewSxbEGhAg926ad0xfruZDpRoNpx
	 zNig/tCtqAh278rOinU0T5FHlyyWKL0dAK67Fedq4h5Iql5KalWpFlZeW4tPnj/cV7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795468178;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:From:Subject:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=ANnf0uY5iDkomZkh+ngxY/U/kEJUmvmc53h0kbXzIDE=;
	b=XtzvDZXhVbIBTCnfzn+/E7VulncSlW2taDdZjrQ3j1ek4EvIj9IECui8oNelC6176o0Q
	 Wd8nR3By/ABtFs2/PiaNEM3gn0M8c7UqPr5xbgc0vzJpngo79m3fHhlYi1IfFiqskHayK
	 zuuipvvSaSTOojuZ1hiyNKhhwOzpge0xoh9ybDVDpN0GaEsMQxCV530qoRAy7sbx19JJN
	 ZnLYzdbZmaE69fZvMacZaXdoP1LYO0c5JSPdrxKQJDliMlN1JKLVVOAJ708YshJ/vxlFt
	 INUrMnHUOqhh2BlCsqa4nmtDBB/eQdbmtsaVYi/k0dePj+byeTe9ZknviTfvHC1QKDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FuQsaC1i;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YKUyaNR1;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 565F6606A326
	for <linux-clk@vger.kernel.org>; Mon, 23 Nov 2026 21:09:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 565F6606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FuQsaC1i;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YKUyaNR1
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANJuTIB1332635
	for <linux-clk@vger.kernel.org>; Mon, 23 Nov 2026 21:09:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ANnf0uY5iDkomZkh+ngxY/U/kEJUmvmc53h0kbXzIDE=; b=FuQsaC1iZaTueUUO
	o9C6laKvSWwyB+2gcbL9eu9q0qRgveJpvFr7nu8nMZ69TdKLtk4Fh8r/H1/WZPeG
	g/i2dacKlbiXurAaTuk8nnZ+TvYnThdXyOwHOBM/+iWFMDD8dN5oMJzUuix0VSFa
	27wA3kvZaxW2QWV0ex3E0QADLZWV7Ua3ZSLUSd2ks2sMmdA50GjQEaOQR/ouX4MX
	S0DQeoiKDRY3U2qWsGa/jHi9VjSuzPAS60C1U3FqnGwjkS7zL92ymoHzMoPNF6DP
	8wJJW/pDGYzlJfJQlAwSUOnEhYZGgvKvHj60AHvd44AxVDE3AeZeYc7mxo74GF9k
	1lNV9Q==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g743g9s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 23 Nov 2026 21:09:37 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9495a1f5e47so621537285a.1
        for <linux-clk@vger.kernel.org>; Mon, 23 Nov 2026 13:09:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795468176; x=1796072976; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ANnf0uY5iDkomZkh+ngxY/U/kEJUmvmc53h0kbXzIDE=;
        b=YKUyaNR1Vw2bBUXphEHlWjARe/5V8IpoZtJ2FirD9Z4MuJpZ641isdO5xETL0I1YMC
         GQO6aHMB39jEX9nAtoA+BrHFZ1tkuLsBzCg2LKiP1p+FkUcB1rYLPVlwUUw3F5FWOTff
         mJVjWYMdhlmOVXEVZKNc1suhpHidFVy6KsQTOdsZjF3iCLUrQkMmZ+gobsG9M/+PLLUe
         zv7NQQk6tcrUUKuuKJplcczWciONK8AIqWBGW3OGKEg31vu20kr14MyJiZY0GJn3S5PV
         mzrklvsa151gxt8dcvjQft+R2l9jTuYj+bkHSh7cdXDOgwfO0Pd41PbGQ3WEZfUrBBgp
         /3Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795468176; x=1796072976;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ANnf0uY5iDkomZkh+ngxY/U/kEJUmvmc53h0kbXzIDE=;
        b=a2UQ6dGVRlndgMHQjEUiBi2juGXBvVDaCabtw+UTditBzTk++9KB5JGOO2fY7wydsu
         Tpv6zM3HZOWaL7eXp+4eZyze0t4tL9jDw6hWaAIcD/E96xbmiq6dgibF9OUHalNQ9FoO
         yXtbvK8522B2h5J9u53Won0avFFraH0clv1OR6D/L3uvePKCqpAm3NmKAqiiqxRZxqST
         qcIWKXeI8vXjhHdCoPRUcXuWBDPGlcg6K2qwR2F/BQZGCwJfRMxoGSdYsJqG44hXu/fI
         F0nadikijQXIxWPQtJhe2AorZKJKRdzEhkD4qm5rRBRtwp9NH7U7p2k8UKS4BonjkXS9
         05Lg==
X-Forwarded-Encrypted: i=1; AL+hErG4LRwS7zO6GQvdvW9Zei/pwSYFZJ7tvy1hLx61D3akZDZq9uR/JxmH+cEfi+chadrVNc5icRa3v1k=@vger.kernel.org
X-Gm-Message-State: APuU4Z+nrAEZTypYrKXDcPB4M/SkBH3t9cVOpb1FPVtf23VereJm6b4D
	+a23Qxt2zdus9c7cY1QbLRi3s7E4X8j19Qjagw9pAVODN5nqQDHlnLZuD/aPd/2wvrfPQwKICiC
	kKXkQP9D18nqy+SUZrOu8oBaZTe3r/fpZ39YkV5F4D6UsseXtIeideY+UtNqXCAM=
X-Gm-Gg: AZFdTZdlWLKB4y1QSB9eqyLEcSSbaTO7ACQFXLAkdFOGsPqRzTij14Ltb26X1MUcD1z
	mf3oN9nGx12hHW4a6khF4+vwG9YxkCYBCdsX3Yc5eRmluV7phEkjCwi1i6KxEKPR5dBn5hTNhVn
	lKnNinjqqm9JMlOwawQVrNUjkIPF4urCSgsU5ONrHlXLTgl/fYBIGLMtt+63kLjyZMe7KTrUVle
	kMWoUzTnhQlS1wAeULWfSmPOmKhDwx/C92N2H+jTsdrxiOwnKOvO/yYvsBpN6mayPz9i6kiuJfm
	2RBabptd6+LWRj0iZbCK9nJ6IHShraHZy9fb4hrE9N0dRbbYyA8gImY4WdoiJTJoDfx4Vs59SuO
	N5kupJmaCNOqAFe1+Sobvm3n76Jv7FGCwzjeaX9No5CQvfJxl8ADI6LDmIbS/
X-Received: by 2002:a05:620a:6c18:b0:949:6841:2ba2 with SMTP id af79cd13be357-949ba96e544mr2214618985a.22.1795468176496;
        Mon, 23 Nov 2026 13:09:36 -0800 (PST)
X-Received: by 2002:a05:620a:6c18:b0:949:6841:2ba2 with SMTP id af79cd13be357-949ba96e544mr2214615585a.22.1795468175977;
        Mon, 23 Nov 2026 13:09:35 -0800 (PST)
Received: from [10.5.0.2] ([187.14.51.61])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb3f5c31sm893876585a.30.2026.11.23.13.09.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 13:09:35 -0800 (PST)
Message-ID: <01bf064e-cd0c-47cf-bc06-8410df2e20e7@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 22:09:33 +0100
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
Subject: Re: [PATCH] clk: qcom: glymur-dispcc: Stop mdss_mdp and mdss_ahb
 clk_src from getting parked
To: Tobias Heider <tobias.heider@canonical.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
References: <20261123-glymur-dispcc-park-v1-1-d636ef8e04f6@canonical.com>
Content-Language: en-US, nl
In-Reply-To: <20261123-glymur-dispcc-park-v1-1-d636ef8e04f6@canonical.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 4Otfy_cxwyuRANHfCEYix7rJtKg5Va82
X-Proofpoint-ORIG-GUID: 4Otfy_cxwyuRANHfCEYix7rJtKg5Va82
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA4NCBTYWx0ZWRfX3E7FZ4MWuTaP
 64y13+jnwFPHwNM+lAt7j18RZg3T+PbbYu55jnazXuCCnz+WeNPFw7UNx9lCBiuliOhKBjy9BBs
 oWodyXus/1p1QfyROc0vL/yHdKHDJUk=
X-Authority-Analysis: v=2.4 cv=T/cZ3PKQ c=1 sm=1 tr=0 ts=6b04ab91 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=DHU7RWTm0b9gVmOwAZ1hRw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=DfNHnWVPAAAA:8 a=EUspDBNiAAAA:8 a=LHNQcD5hdC2IeSFHG2AA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=rjTVMONInIDnV1a_A2c_:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA4NCBTYWx0ZWRfX9RhhaIRc17MG
 Q2Em2GTg6MaOLl4vVVDOyCTrOwtvCzeWvUlj9sZTxrQqBQV7ylyEcD6Z28F+0txB2u7lAXK66+m
 sXkt1Ii1J9pp/zbnfo2IFVlMBdLuo90QsiG9tGBxvydyN6X5oQ9Yw83gxKldGfT1ewgjyl19yhk
 d4ZjWPlLYKEy7JF9uB5sDeSo5tmTvULIHkSlDJdscTZxR3XDEmgb+ks6Ejk40mN314JI/2C/hGO
 9bsguXhYkZHh530URTkrrM2EUtHZ0UOnssXimePXVAn9HKEMkeeME+W/+6hOSGETPAhi8YGeXdp
 Nk1BDCPCQnM1nyS1vLoaP5NUufSWTUUc4CleGuNYDo3D2/B50ONJJuXHpOgqhWJaejJOqYTlKD/
 UdsHQKi+IKnE0H3BPi4sDlMacmzFUmWcTHX15oNJYLNk8GzYwtOMFaVMsA87xn7dOsQyK2p4jVs
 H+Wf2Hj2AAwvFMw/tzQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_05,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 bulkscore=0 suspectscore=0 lowpriorityscore=0
 impostorscore=0 priorityscore=1501 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230084

Hi,

On 23-Nov-26 21:48, Tobias Heider wrote:
> Parking disp_cc_mdss_mdp_clk_src and disp_cc_mdss_ahb_clk_src at 19.2MHz
> kills the EFI GOP framebuffer. The EFI GOP framebuffer should keep working
> until the msm display driver loads, to help with boot debugging and to
> ensure display output when the msm module is not in the initramfs.
> 
> Switch both disp_cc_mdss_mdp_clk_src and disp_cc_mdss_ahb_clk_src over
> to clk_rcg2_shared_no_init_park_ops to keep the EFI framebuffer working
> after binding the glymur-dispcc driver, following the
> precedent of commit bc27dbefae6e ("clk: qcom: x1e80100-dispcc: Stop
> disp_cc_mdss_mdp_clk_src from getting parked") and
> commit 5285b0467578 ("clk: qcom: dispcc-sc8280xp: Don't park mdp_clk_src
> at registration time")'
> 
> Unlike x1e80100, where mdss_ahb is never parked, glymur's ahb also
> gets parked. Unparking disp_cc_mdss_mdp_clk_src alone was tested
> on the HP EliteBook X G2q and is not sufficient: the EFI GOP still
> dies unless disp_cc_mdss_ahb_clk_src is left un-parked as well.
> 
> Signed-off-by: Tobias Heider <tobias.heider@canonical.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>

Regards,

Hans



> ---
>  drivers/clk/qcom/dispcc-glymur.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/qcom/dispcc-glymur.c b/drivers/clk/qcom/dispcc-glymur.c
> index 32cc5226b4de7..6eb4ca8b3e771 100644
> --- a/drivers/clk/qcom/dispcc-glymur.c
> +++ b/drivers/clk/qcom/dispcc-glymur.c
> @@ -312,7 +312,7 @@ static struct clk_rcg2 disp_cc_mdss_ahb_clk_src = {
>  		.parent_data = disp_cc_parent_data_6,
>  		.num_parents = ARRAY_SIZE(disp_cc_parent_data_6),
>  		.flags = CLK_SET_RATE_PARENT,
> -		.ops = &clk_rcg2_shared_ops,
> +		.ops = &clk_rcg2_shared_no_init_park_ops,
>  	},
>  };
>  
> @@ -623,7 +623,7 @@ static struct clk_rcg2 disp_cc_mdss_mdp_clk_src = {
>  		.parent_data = disp_cc_parent_data_7,
>  		.num_parents = ARRAY_SIZE(disp_cc_parent_data_7),
>  		.flags = CLK_SET_RATE_PARENT,
> -		.ops = &clk_rcg2_shared_ops,
> +		.ops = &clk_rcg2_shared_no_init_park_ops,
>  	},
>  };
>  
> 
> ---
> base-commit: 909ef7a9a30fa139e69e555e3606680f5cca7726
> change-id: 20261123-glymur-dispcc-park-53b7642cd626
> 
> Best regards,

