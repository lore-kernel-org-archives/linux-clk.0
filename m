Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E3C538886B
	for <linux-clk@vger.kernel.org>; Tue, 13 Oct 2026 07:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791876863; cv=none; b=ptjTCMSsFkDEOE1Pn7WaL+kez4OmtMN6YCzAedxUDx1jXq7GWOg3oOa5+C0j4gyrtoIZFb6SwLu/wotEtZV1XE+mwkLL8p92CX+OWa5J9QGdX3iaJ/wbW4CuEy4XmoPkpxS2Remcurk/QlRuC2GX5GbOmN/6mPSbgbZT5WIVd+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791876863; c=relaxed/simple;
	bh=8CM8aIHOLKQYGl9kQpNJezkyeRVuvZsczkI3dBwxjSs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rRWw7e6iD1ho2akv01CpbynjrOu0Y558Q+AdS2B2rAEX+EGpEMl94NJNPQajKJaWjEMeYRsrygfk0fhQjN0sIncrDeE2xnO9WKu0O5m329ZXiX0krr/CaMgotwIWPsiddSaaYIDgVtVfkyJiEC2oGU40kOPnN94ygdgbWJX/PGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KpgI+G0O; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B8H/6Wbd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KpgI+G0O";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B8H/6Wbd"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D20rKw302935
	for <linux-clk@vger.kernel.org>; Tue, 13 Oct 2026 07:34:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EWyzGVy9o8kahTA4UC4n5dJOYEFCn7m6ZmkTfoIGtDw=; b=KpgI+G0ODXFDF4a6
	TBIgRKw72RmAasJ566kSzlZK+S6sL3Qe1d1H5NxtZqBKc3JMOWzCT1gDCXpOaVV+
	tPkFNv+Z8JHC/cDnKpkpHppemaw9gD/fnmA2/hQmCzkh9AsQh5JWLP13/vBaYq6Z
	cPDClUFDuZd5xiwpZlm7ohefTbFWnBAIauu7XqShTgadZH+cf1VU4L+YEQG3UU1H
	7EFnf1aHw4j9cL+8HwNnl1APJseXSNj5i9vcWoV9DBCisJpXFM14dRGA4Onxhwe8
	DuU4GrQNa0I/tp8nUPwm8+EIopxX2jYjsnYc3kxwwv1pG4ThEjrz+BZ4kyjOyuH+
	/E5/kA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h98sq9mv7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 13 Oct 2026 07:34:21 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc1ca15334cso2824359a12.1
        for <linux-clk@vger.kernel.org>; Tue, 13 Oct 2026 00:34:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791876860; x=1792481660; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EWyzGVy9o8kahTA4UC4n5dJOYEFCn7m6ZmkTfoIGtDw=;
        b=B8H/6WbdlTL8UYBHPKp6XH8c1XdxM+24rYejO2I1C8YaETv4MENR2fvl/KNnf6dEId
         r0b5jfQCpDpdY+zYGsU3xZjRXT/ADcoKoFmo18r6nlt0i9XrxpaCrO6DN2BmTOYE3enp
         /h2TUN0vbczHiKvu4pLA8KzHFdldoGTKCICkWTh8wCBvUjgVJkiSDLxzBsI/CdLp6+7D
         E5EymQQ7rgYY5oEnJrw6XVeorllg+kglAqV3TcGpwpOcLU9fFGaulrGw9dhlk7khcvwd
         pLrmD1y9AW1BuwnPsZz+KafC8yUdCO1DmQzsQA8VzBUMuQt42r7dcrrFBkGjPEBCEPOm
         LmCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791876860; x=1792481660;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EWyzGVy9o8kahTA4UC4n5dJOYEFCn7m6ZmkTfoIGtDw=;
        b=cIWo9jucKTqFLnUYO4EwCYRZRD2nPUVFN59Ti6/PyLzXlQRYDukTg6T2G02JnjGQ38
         CrHGaqabNrgsSIVVHT5obZpqioew++y+JDq35BSzX+r7AcQ3yMcieRrJKpNUXG2TSmER
         ZaedHLgvBW8I2Yqd3G/Pc29GlGzEi4fURkHe2v5urpLE8yG+aOpV90oufaW3CI9+VA/Z
         ojiTL97LUKbxBHikrZJxbWKCK5MC/vRlUWDJ1ZPlkmqnXVELc6brBoTuV78Pq70odHSB
         SJwYoy0aufqNUdzE3GoRA8IhVFZv+WdZj7dsiTRb9YRU0Ah01yWh+m7J4xQLuULc/IUP
         GttA==
X-Forwarded-Encrypted: i=1; AKwUvBzHGFOHq71HjKfHf1vXfxvRAIWHtxngVHc9wFOgFp7dOV9MmcEEH8S7txgVH/LaCieKScgmP5wZboE=@vger.kernel.org
X-Gm-Message-State: AFq9FYKz8VYy1NKSgN/ze1kNukPeqC7wUhYjb21A6k/OpndqYYkD05WD
	Oy0X3z0DeBy7FOeh6YWY6g30Vt+jj1yJUCNLUYb45yEjacyEUkrkniv4XHjOVfe6xkNeXad0wtO
	nCuzJznzg+B5DVHY0CPRLgV6I9kfmTL5+W4LwCPRHTyoWJeZ74h8YkLVS86AdpJXziAz2CT4=
X-Gm-Gg: AYBFou1xQvAZAeumV9LSGDptARNVtJgLtZlCaaoyKm7wvX2M1HSSkKQYGcOcBl1SNhG
	exYt3NLYJhC4XmStLLbV4L5Xdu55zxhBTIRCMQKydx1QKWQDwV8svqispW+8zoKppcrSEmddXXi
	sfxr6iUq+k8CouVpIGC85ipOuXUIqDql0S3YS/Qu577mwknuTpNc9Y5VWZb946n+W/sYw/goRex
	uyrz2ANXSSUR6L9XoheaElfPyWyA/8ZN2Lu5ZWfEMtBclDFAm1nZYGUv+b+86W1HYFPmUZB8Zs/
	jMGcw8XNKjahXEQ4DrD+jLQaKpMbzLSbCNioqA864XifHCzy3/FbQuu363MvtdvWa+1akJZogzy
	wtdAzz0WEwSVebMoxz2vzLx2NxQ==
X-Received: by 2002:a05:6a21:7d03:b0:3dd:a196:69d7 with SMTP id adf61e73a8af0-3e16be947damr10695528637.50.1791876860241;
        Tue, 13 Oct 2026 00:34:20 -0700 (PDT)
X-Received: by 2002:a05:6a21:7d03:b0:3dd:a196:69d7 with SMTP id adf61e73a8af0-3e16be947damr10695509637.50.1791876859788;
        Tue, 13 Oct 2026 00:34:19 -0700 (PDT)
Received: from [10.217.216.28] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-896c3ccf7cdsm4626313b3a.30.2026.10.13.00.34.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 00:34:19 -0700 (PDT)
Message-ID: <2e4d9a74-cf38-416b-b3fb-15584301e540@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 13:04:13 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: gcc-kaanapali: Enable FORCE_MEM_CORE_ON for
 UFS AXI PHY clock
To: Joonhoe Kim <26rote@gmail.com>, andersson@kernel.org, sboyd@kernel.org
Cc: mturquette@baylibre.com, dmitry.baryshkov@oss.qualcomm.com,
        konrad.dybcio@oss.qualcomm.com, abelvesa@kernel.org,
        bmasney+clk@redhat.com, jbrunet+clk@baylibre.com,
        nitin.rawat@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261007143716.2161-1-26rote@gmail.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20261007143716.2161-1-26rote@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDAyOSBTYWx0ZWRfX3avxJIyCmwTI
 3aNybZ4ZyjJCG/I+PCGe0f2t5uA9B3SdyWBh4gdIiYyNCb05ou1x/a3sR15tPfnFonU0gC0nXDB
 UdfLr6NMk7M1r6GDbDm5vDl7Q+JlgSu2jy7D4Hu0S5x5YRxyysPqHH0bmD3ZqRtEDrkHxEKb7FY
 X4BK6yhTaTY2rzWl4uC+m0K4H07XQn9LvA3t1Im35ik6PEcacRwQkYBUYzu/K7DPZqj1/qGB8EQ
 6wx1PgDrNZTL7zX6x43elEhcoDY7OXF+c5qmcSIt3jngl442zIZ4mlYZWU8wCcvOHa5JFXYS7NM
 UqP1O/ZC6dXlEw/7Ls/kDGc9YXLPtJpYhUkkeS+vTwZsxs1qPItzUitkDhVzbNliOhQCM7wQwWZ
 xcDfBvajv0Kg6kTJlQq8U8p31FOnI8SVcEBHR+E2oQyxTsfR06hDuzvQJmeOw+kKlc08ghwIuYG
 Kop8JTKWBnrkL1Y8pWQ==
X-Authority-Analysis: v=2.4 cv=JN+uIMKb c=1 sm=1 tr=0 ts=6acddefd cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=rmWnoBMNTd-Rc1pBGecA:9
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDAyOSBTYWx0ZWRfX/pckqDhqFue7
 QCRluKng4Dzayqq6lcrL1Wl1nhx5fQI/jf0OAqyrzSKFQjZA5aGtzvzQcm7gQnCj3fuNjEcsma1
 B1F+yUrRawSPMx9N6vLyIndUXxzfykc=
X-Proofpoint-ORIG-GUID: S1h0Jzpx9kd26qmk9dNvAFSAkeV3lVo2
X-Proofpoint-GUID: S1h0Jzpx9kd26qmk9dNvAFSAkeV3lVo2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 adultscore=0 suspectscore=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130029



On 10/7/2026 8:07 PM, Joonhoe Kim wrote:
> As on SM8650, SM8750 and Eliza, the UFS AXI PHY clock needs
> FORCE_MEM_CORE_ON for the UFS controller in MCQ mode. Without it the MCQ
> configuration is lost over system suspend, and with MCQ enabled every
> resume from s2idle ends in an SMMU fault and a host reset.
> 
> The UFS PHY ICE core clock already has the bit set; set it for the UFS
> PHY AXI clock as well.
> 
> Fixes: d1919c375f21 ("clk: qcom: Add support for Global clock controller on Kaanapali")
> Assisted-by: LLM
> Signed-off-by: Joonhoe Kim <26rote@gmail.com>
> ---
> Tested on a Lenovo Legion Tab Y700 Gen 5 with MCQ enabled in its DT:
> the MCQ registers keep their values over s2idle, 7 of 7 resumes
> without a UFS error. Kaanapali was noted as the missing one in the
> Eliza thread [1].
> 
> [1] https://lore.kernel.org/all/a0b6030f-be42-4f5d-a59c-
> db78912ff0de@oss.qualcomm.com/
> 
>  drivers/clk/qcom/gcc-kaanapali.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/clk/qcom/gcc-kaanapali.c b/drivers/clk/qcom/gcc-kaanapali.c
> index c9473fb79ccc..6834f43b72ca 100644
> --- a/drivers/clk/qcom/gcc-kaanapali.c
> +++ b/drivers/clk/qcom/gcc-kaanapali.c
> @@ -3484,6 +3484,7 @@ static void clk_kaanapali_regs_configure(struct device *dev, struct regmap *regm
>  
>  	/* FORCE_MEM_CORE_ON for ufs phy ice core clocks */
>  	qcom_branch_set_force_mem_core(regmap, gcc_ufs_phy_ice_core_clk, true);
> +	qcom_branch_set_force_mem_core(regmap, gcc_ufs_phy_axi_clk, true);
>  }
>  

Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>

-- 
Thanks,
Taniya Das

