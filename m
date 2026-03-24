Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 852F33DD51A
	for <linux-clk@vger.kernel.org>; Tue, 24 Mar 2026 09:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774344278; cv=none; b=ARH/IKEae7ruSi9cfC8ZlR8ARAyzdywksTku8pGjnpygeeK1kOFeVyZ8vJuCICXYh6NTma2VZOYT4j4OhxfRf+716fGsZ0bImyxjPOXKQv1XAdEcmgqLnFMkEuQQ2IApC05LWS7fW5qQsuGIeYtQ+FbcDTiYR4oGP8KmkFj7Cbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774344278; c=relaxed/simple;
	bh=AP19JN9q7Q9WqUAkwPBBf8tkeOsZC0sQYFAG3lntLXg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qXgmWjf79DoLMVySvc5PDHHYGw9H4JNGAbw5FixZXJBcYRpBuVhReH5GRSqXra6d5XkToLCxHjvyJmM8X2AINwDsMt7jctCtuEvoc8J4XXCnIPRIWI/b4NYGyRrZ05B9s31OufqEdR+9HpbVFOPtX6RUCu4we9aR7QAkj1I/beA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Usl+ED/l; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ucz8CoUZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Usl+ED/l";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ucz8CoUZ"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62O3WRnd3170681
	for <linux-clk@vger.kernel.org>; Tue, 24 Mar 2026 09:24:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NdbF+WHqgSviT1YzQoCcqfQyKyiKQ0l649deTJeEwOI=; b=Usl+ED/lN93wur68
	RSovohK1kYxaz6Ndh0gD6bGpjRjIj8YdHynHf8cGjDHelZPzUTyTlr1qM+MR7+bL
	T46/i/XP8NCSK4GkRjMATB4reGu+cXOeqFwrz6A1WuVmqJhoZtLXplQnymd2Z53y
	oePS3oZnkcGcI/FmqoAjX9W8IRsJ4BF6LaXtHh+10YLPBuhibxxs4cTRriY4LGzx
	Rkr+evDJI/ghJahQ+DASc0P+n4uXDLz21D32kGEvZsPUOZ6whGXSTnGF6YwlEZ1N
	j8vHU5id4TbIARITWxPDkL8SDjD3rMLKGhjERYs1/V3yqzPPNAoKMPT7CVLIwxJp
	KnvyDA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d35r2405t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 24 Mar 2026 09:24:27 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2a90510a6d1so50329695ad.0
        for <linux-clk@vger.kernel.org>; Tue, 24 Mar 2026 02:24:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774344266; x=1774949066; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NdbF+WHqgSviT1YzQoCcqfQyKyiKQ0l649deTJeEwOI=;
        b=Ucz8CoUZluriAEmByv0VczTsHxxTPNO6+hh5w0cPopyt4vEUcQrShECk8zMQexBVWu
         J51rDO8W59ENtTzzpC60RCJ3OPTx8LnhU7ljiVq9Rkoym0j1ntbGxQElL69lItDGYbk0
         K2XY4Ccc04R8dcBQdWMtNRSp/PWcFFtBuNzg2w4J2zcPxvABZLvj0qkpVk2NoQD7fVDY
         HbbQu3ZFkKWhjMie0L57h6dGMwqr1tnj1Zgyl527aSmqDL7AMB+u3/PNIQVI/UisRhm3
         627wM1K0KFH2MIIuMTE6yqo5coePzKTzOYx69We94znZnPRbjJlnIhenbHaiwuGXA7Iv
         p0xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774344266; x=1774949066;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NdbF+WHqgSviT1YzQoCcqfQyKyiKQ0l649deTJeEwOI=;
        b=bMvqAVEjMVL6kvLO3zrKYmTm2dlLE4SlAatHba2oBIQgbjoQ45e5DW9l4Z1L3wWKT2
         zKY97wiaAqmQ7TyXnPAMsM68R172F6G/ErqA8SGD9d/LOUUfUoCVxJXlzyz89aF97nvQ
         C3ODcJns901S/Qehx1kGdqtRT0swP03mPPaG8ajM2/UQJ5b0EmppaXV1hjWfaRvwveQ3
         mMTUqQgHQeVq1qetEvkoLZ5e+vEaZ+7vC22EU5l5b5LUZt1Xak3aaOjszBH+K+7ui2ja
         1/FGbLVNFXyaIwcyXgmI+vTXvnUD331tG2UWO5FLFqBaa8IxVrlk+ijzGmyrIetw8fFA
         fXYg==
X-Forwarded-Encrypted: i=1; AJvYcCWROK6p2tUOGywdhEfjnmVEloZDuK7yg4hVw1huca44JuRj6EbfuC3mcyrS/5VWT0Ue7eABY8Aa7FU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6Ka0np5VlX2PkFQeHj91rZUH6EjCkEOUJ0/17a6QdayEgywq5
	tm6JlQTQPiCG04eDV+lpFKJAj7ayz6Ja/rsyABdAhytKulhXvo/9aEALN5l0pAZJK4fsR23fgVO
	1KvbW8NEv4UEJNDasFKEqA+KfwWVg0jJ8x+UaqBi1JDbNX2V6FFQyxt/W1uTAHc4=
X-Gm-Gg: ATEYQzxMGPMg9dhp/yyxsE5+hBXn8nlwI0a+qzQzDvzViji6fNxgt6AxGZxS5TYosO6
	fSYHYgcxSH+1rfT0ZtAM3IMips8AMlRVdzmhZ9lMGvbx20yku2Thl64q17FHVMaw2k6GU4H5eMb
	isC+TJkhIEV9TO0FUoT2R3b5XbFcA13jY2rfDakVXc6+BJvNJm7Zce/8ms/8cpNhbPknXJGgaCM
	3XepGEdpV0xrnRHq+VkHqmXHwvgcWRI0W/hbnZs6SYIU47OCvKoHKybzN772XfmVR4ArjppfroT
	9W4uBnfYY1QKdQSOVRZfGhCQE5PeIxQB37gDYh+Pnpz0Teu7qmM4jf9fi+f8qWjrXP6e0xLhfug
	bzEaCZH/R41LjicqeFifrahQcmP//ca5/20G2BogemD4OxT6rDw==
X-Received: by 2002:a17:902:ea11:b0:2ae:cdf7:4740 with SMTP id d9443c01a7336-2b0a4e0f94fmr26117985ad.17.1774344265934;
        Tue, 24 Mar 2026 02:24:25 -0700 (PDT)
X-Received: by 2002:a17:902:ea11:b0:2ae:cdf7:4740 with SMTP id d9443c01a7336-2b0a4e0f94fmr26117725ad.17.1774344265439;
        Tue, 24 Mar 2026 02:24:25 -0700 (PDT)
Received: from [10.217.216.245] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0836556desm184335405ad.47.2026.03.24.02.24.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Mar 2026 02:24:25 -0700 (PDT)
Message-ID: <d3327948-97c2-4e6d-b7f1-623edf8f3991@oss.qualcomm.com>
Date: Tue, 24 Mar 2026 14:54:20 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: gcc-eliza: Enable FORCE_MEM_CORE_ON for UFS
 AXI PHY clock
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Nitin Rawat <nitin.rawat@oss.qualcomm.com>
References: <20260323-eliza-gcc-set-ufs-axi-phyforce-mem-core-on-v1-1-b6b7a6f3f8c5@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20260323-eliza-gcc-set-ufs-axi-phyforce-mem-core-on-v1-1-b6b7a6f3f8c5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=VvUuwu2n c=1 sm=1 tr=0 ts=69c2584b cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=HlnE6ubiEgjjOAmxyvYA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: KzPH8S7X4pkanr2SedUC03uy8XJixVxv
X-Proofpoint-ORIG-GUID: KzPH8S7X4pkanr2SedUC03uy8XJixVxv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDA3NCBTYWx0ZWRfX5PefDXGeWsxs
 848U4M+Bd1oFNzydvQDtL9yDLJKEOetnAUQbTbYEbLZ9/T6n6CvqPGIaaoUeTi/78hkh3YbThul
 RJz0GfF7twHGpy4sXa8bKuuwyAzwv28UYuZRgTf9wDbk2ilIpuAE3EwI3L949Oi3WfrWterp33K
 0Bt3wY1KX3fa/HJ++aanh67iNhXp6aIoSeqcrsUvx0dKGlw5mFVe4X1mWfL5meLWrkE+Wblifom
 oQxwblVNl5qi3FdyCDdiDQ7pudWa30rVJ8Qlv3k3SeHFuZn+6cq2xTT4CDnnhVqzNfMGcjYZXC9
 MW2xT7vkzM7A1hdTPbHof2o+4Msh8oyBOCZE4qyLa4loioRcnymnTTtxGgGWjOilRJAZNcBlg7/
 3wp4alOub/itV3iMiOcHLgDvT62gkIdwk2X0fO5SWOx2TA2tdKifMubbjHaEfestO57ZPkeloPr
 6IzZw4w6M35AHSe2Tng==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_02,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 bulkscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240074



On 3/24/2026 12:27 AM, Abel Vesa wrote:
> diff --git a/drivers/clk/qcom/gcc-eliza.c b/drivers/clk/qcom/gcc-eliza.c
> index 06ee1469badd..338494385752 100644
> --- a/drivers/clk/qcom/gcc-eliza.c
> +++ b/drivers/clk/qcom/gcc-eliza.c
> @@ -3046,8 +3046,9 @@ static const struct regmap_config gcc_eliza_regmap_config = {
>  
>  static void clk_eliza_regs_configure(struct device *dev, struct regmap *regmap)
>  {
> -	/* FORCE_MEM_CORE_ON for ufs phy ice core clocks */
> +	/* FORCE_MEM_CORE_ON for ufs phy ice core and gcc ufs phy axi clocks  */
>  	qcom_branch_set_force_mem_core(regmap, gcc_ufs_phy_ice_core_clk, true);
> +	qcom_branch_set_force_mem_core(regmap, gcc_ufs_phy_axi_clk, true);
>  }
>  
>  static struct qcom_cc_driver_data gcc_eliza_driver_data = {
> 
> ---
> base-commit: 09c0f7f1bcdbc3c37a5a760cbec76bf18f278406
> change-id: 20260323-eliza-gcc-set-ufs-axi-phyforce-mem-core-on-2ef9984ed022

Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>

-- 
Thanks,
Taniya Das

