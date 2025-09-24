Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45D16153BED
	for <linux-clk@vger.kernel.org>; Wed, 24 Sep 2025 05:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758691192; cv=none; b=j3NXDO/+71VQBHyvfHv9jwQPWE0Uj2EomqiLKZzgpHIwtyT7LUgnvVsUgGjxYWNKmGbmGYdMesQFBq8fVyVnJ+J4WaSNkMGIcDjOxe9vJV0o0EYiJrWE1408a57eH0PemDwWXiLw8VlbPUa7XfymobEPjPtu1PxHVk62rGm1XRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758691192; c=relaxed/simple;
	bh=gDMmbJDin8g4trp63KWsydkj4NL9SFdV1cVqYH2HTik=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JyGAihPI/mvmCyuWfUmCKiVTyr82F7rxqnR/ML/SAIRDyTLm9Wyj+CIdbnf9llJ7sd6OIk9X76V2X3mQKQqiT+Rh33+xOHWX9dakmgT1kyO4L1GOcoaWccSPtpqhQYV6pT3DOzPzfC2dgBdHRz7XfAtyNdnEgy2Z4JAhvzpLWlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=euPI5jds; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="euPI5jds"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58O4iFDC017437
	for <linux-clk@vger.kernel.org>; Wed, 24 Sep 2025 05:19:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bbgjHGvKyAAeJ5oZigyyvCPSQIleZStCFPhpqS2fX3Y=; b=euPI5jds/e2iBiDH
	G3h92CbH51mWz+y5okgR/lg4qA+jGFwCsYZRWpNL/yF8LipuD9Ly9cFwmPzIbCkb
	F1B1OJjaXHivRvf+Vpxiv6Q1KnzFoMUfhmMjllfVwP/yG7rAeycqiyP5P6QjazAE
	W2L2GbE0LtXkhM2VeNVT/X6Gmum/AxXW8euQ8IFKUU7oxSfWeVadbtqljv9RLB+D
	NgbAG06uGhxXtk72YDevENGFsDsjUWLL5ADS4T03h84EJBokKDXpIA/0auTvepD9
	cMRSZ8+lvRM8X+ecFicNaZ8zh/VmiAqnHe/ztSv+17u3E4qHt6dpLMdzuRIqBLaJ
	sOTPuQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49bhvjveat-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 24 Sep 2025 05:19:50 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-77f29b9e2aaso5840436b3a.1
        for <linux-clk@vger.kernel.org>; Tue, 23 Sep 2025 22:19:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758691189; x=1759295989;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bbgjHGvKyAAeJ5oZigyyvCPSQIleZStCFPhpqS2fX3Y=;
        b=pEJaH6uQf7Why5NhPDvK9tIL8166Q4EE4soQziQef0q9gzBn1I5E7kL16douiMjzxa
         sMkDwQuEyRyrQMJKSK2y9oaqXdBMvvnhzFXzwQBdgw62S4jcogUTuBNg6fw7wnIjisr9
         DxShWJAeKV35763cSRNOuIN18h34p9ODpSYZPyE2LNGWA9ws7HQKtUJtkGtRRXIoJxcJ
         wZ3lzA6NfmqF63tRHyc74DX1YwpZcMbQF2rACIG0avUILRVROpW0f//WMgs3jOT3LcpY
         jFP/6v2gwnUYzmVSvNMcVnbrfd8TIJR6ceJl7MpDmC/pm2rBysiP0ZejZTJwl/4TeJWm
         ZZow==
X-Forwarded-Encrypted: i=1; AJvYcCVFkhR0LRS8JieV+4bsgDCt02xMtsQHd1XUpC4dVpJ/r12nra+lE+W2rE1UJ9atSx9TgGeiqZcBbpQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzImMwRXcDu5D6KAOsG/sgjsnaBaDKq33nrtMgXWNBIDIk6h+pn
	3YzhHtd4ClmmPu3Wlfl7VhXn7eCwxWx7zCfq+7oIrUa1Rrs4Kv8DA64I50J1+XVV4Z99S0Giz3e
	+5RmniFwQWNOJ5AeYcycyjZ46xsY320vfAxzkJN8RBPIUtHQ3kkqDuVbH3oXFtWY=
X-Gm-Gg: ASbGnctJ362GW7GFp8Fw1DT3vli8BstbGIh5tz6VmIQqU7fV8oQbn1dryjT/qX2Niub
	fJ4V53jM6nBbHIAYQ34TgSz3LiM5MYkLrHgIGoHVAM08jsyd0VGbVy6sXSd8jGGFP8Rl7YuRNbd
	MiOa3nLH9z9nGQzvMdIBTSeNus0jPZThtEi9YBXwhExdb5ZUGfJEKxqKld/q5viMCSUIvFQQnpc
	Ws6l6LWwaHGykFsRILgoxXuwJuJRWqlezZaFWcpSb5ehdAE7KbTfZHfDvjXF5gUiid7lmQUsYNx
	w24issCMbsj+OQMQQi8G3pM503l1/9HAkuqBpEhzwRdSjgrCCkGkZsIh58aTeI5vXds=
X-Received: by 2002:a05:6a21:3290:b0:24a:d857:fcab with SMTP id adf61e73a8af0-2cfdaf0bcdemr6339898637.23.1758691189309;
        Tue, 23 Sep 2025 22:19:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEKWR4642Yw5maqKFG82ykSWIdzBhL17R+UP3C4cLfdONnTKmSW6HpeHdooGU/0F96sm7uhPA==
X-Received: by 2002:a05:6a21:3290:b0:24a:d857:fcab with SMTP id adf61e73a8af0-2cfdaf0bcdemr6339872637.23.1758691188899;
        Tue, 23 Sep 2025 22:19:48 -0700 (PDT)
Received: from [10.218.33.29] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77cfec3dadbsm17384435b3a.68.2025.09.23.22.19.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Sep 2025 22:19:48 -0700 (PDT)
Message-ID: <a0a83512-9eeb-444e-ae75-cdb877076a45@oss.qualcomm.com>
Date: Wed, 24 Sep 2025 10:49:32 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: gcc-sm8750: Add a new frequency for sdcc2
 clock
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250924-sm8750_gcc_sdcc2_frequency-v1-1-541fd321125f@oss.qualcomm.com>
Content-Language: en-US
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
In-Reply-To: <20250924-sm8750_gcc_sdcc2_frequency-v1-1-541fd321125f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 8CQo2TBTS0q1pflHI2J9FKXe65ETlMyv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIzMDAxMSBTYWx0ZWRfXwgeSyA+l5OWK
 2IF9+tH2bOxpRDK87U2rlW2DkzMzdu+JPtpEjradXMbAZsyciTdZNFMGT8xFQBWSXQeBpk3HNl0
 kpzyt5viBH4+pxhOgXhSXA52qX53Orl1YpD0Mwe9JONNttx84zOOHq70Q5UtrBFwBBgqA/Evc6/
 6gStiJh4o6WTzds88ih58dfD+S+YmBnj5NBK8mG0dkMMjm8gNCjvuctRhvRVVm99VMqoeMfafiZ
 u1YwxrXrjSTnMFE0agsRAccfZqdYcAaL2PrMcjapKrrRr0s46LWa5hucM7haSyTBgPV0+jvQHnv
 Ore/tcr5XuqMPg9t0cbKkCDC47F7Sdi6R3EmF59/fbTtmvuHbY9Hq1truc4K5Jb2cSVIZxN4RQS
 j2tj1LK+
X-Proofpoint-GUID: 8CQo2TBTS0q1pflHI2J9FKXe65ETlMyv
X-Authority-Analysis: v=2.4 cv=Csq/cm4D c=1 sm=1 tr=0 ts=68d37f76 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=aG0I0WmwaBOL6KmX638A:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-23_08,2025-09-22_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 adultscore=0 impostorscore=0 phishscore=0
 clxscore=1015 spamscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509230011



On 9/24/2025 12:08 AM, Taniya Das wrote:
> The SD card support requires a 37.5MHz clock; add it to the frequency
> list for the storage SW driver to be able to request for the frequency.
> 
> Fixes: 3267c774f3ff ("clk: qcom: Add support for GCC on SM8750")
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/gcc-sm8750.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/clk/qcom/gcc-sm8750.c b/drivers/clk/qcom/gcc-sm8750.c
> index 8092dd6b37b56f4fd786e33d4f0e8aabcd6ecdfe..def86b71a3da534f07844f01ecb73b424db3bddc 100644
> --- a/drivers/clk/qcom/gcc-sm8750.c
> +++ b/drivers/clk/qcom/gcc-sm8750.c
> @@ -1012,6 +1012,7 @@ static struct clk_rcg2 gcc_qupv3_wrap2_s7_clk_src = {
>  static const struct freq_tbl ftbl_gcc_sdcc2_apps_clk_src[] = {
>  	F(400000, P_BI_TCXO, 12, 1, 4),
>  	F(25000000, P_GCC_GPLL0_OUT_EVEN, 12, 0, 0),
> +	F(37500000, P_GCC_GPLL0_OUT_EVEN, 8, 0, 0),
>  	F(50000000, P_GCC_GPLL0_OUT_EVEN, 6, 0, 0),
>  	F(100000000, P_GCC_GPLL0_OUT_EVEN, 3, 0, 0),
>  	F(202000000, P_GCC_GPLL9_OUT_MAIN, 4, 0, 0),
> 
> ---
> base-commit: ce7f1a983b074f6cf8609068088ca3182c569ee4
> change-id: 20250923-sm8750_gcc_sdcc2_frequency-debfdbbab8b3
> 
> Best regards,

Reviewed-by: Imran Shaik <imran.shaik@oss.qualcomm.com>

Thanks,
Imran

