Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B08E4D09E0
	for <linux-clk@vger.kernel.org>; Wed, 16 Sep 2026 10:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789556284; cv=none; b=TpcAqlUhcZE/HvuMNQ3GT7Tpsit9PEHDQNGTHA78K4NyhbOGxHoBAETAXE9pHotXhXGjdxE4Q0EKJzLVUBxth+HQy0l9Pn/rJiu2iWybcakEVhK+025d1WjYW4KDB+nOonS/7pPSVScnFw5AX1VP8OGyd5Xd6S3/nbC11KiEzH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789556284; c=relaxed/simple;
	bh=OV3wyHhaayNQTC4WjVNcdURR3xbxXd+E1ZZUf/4ov70=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VDxnP9qVGAr3XUy8qsVFzVkOGmfgZSLUYeWMPJtpHRwR5tzKWahQ7HLsDUsaO6KDizAGMC5j5YlRapbHnyOqwUbE/Y0mPPVxq35c9rWwPlO9PDuk0G2dpnhaOpVcrHp5DX/4IUAzojz+Bqwxag4OHvgN306PYCQBde57b+hOEhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YvY/DKKV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c3oo54Em; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YvY/DKKV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c3oo54Em"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68G92q5X978379
	for <linux-clk@vger.kernel.org>; Wed, 16 Sep 2026 10:57:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Io2ravhkOMIcfAcfh4SBgZRpLjfHYqw/T1gKpXFQEN8=; b=YvY/DKKV4DWYjclx
	I1cG+koc29eOnYPpj9sCXfbLUr8yBCs9eXAEMNGwympZdsrz2uSo3IL+UQaESejt
	lyw5HfJC5j4PMvGu7M3LrhqooZMs9mlY+KgLgMn7lA3SxzvCXmMtjiSp8Q3SG1cW
	BBov5R4fzwUtSzVo+eTHfAZsJFjBlC3M5LdnXQGT4yZsgNOC/MHo3LPi4nBfvPtQ
	BaOoYMyC1ZIGo9HExXpPIhbMw2fPNevhy9WSR/+LZsZ1xKKq66n8TiPFON2MziZv
	Q/iIYXSkBWidMI+auJ/JNnieOckjov6gjt2ZLJ3vQkapfUBErQYcJDIBd6fxsq+C
	9ZnYNA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqqp3rjys-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 16 Sep 2026 10:57:48 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cbedbd182f5so1740006a12.1
        for <linux-clk@vger.kernel.org>; Wed, 16 Sep 2026 03:57:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789556268; x=1790161068; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Io2ravhkOMIcfAcfh4SBgZRpLjfHYqw/T1gKpXFQEN8=;
        b=c3oo54EmEHMTU1F4kr+DxKAGljOyjt8MTjSaeTo2dOJ3ODeGkZjZ2jjwpQouDpfFel
         t0Cx33ZdBsirlX9nNMiO+mdv++t8FYCpBFFa/e2wxR4bIzRj7C8X5fX9HFNFcbAfM6EP
         guz/Qu6WOtQHtpULHewfE3F+WVuUQEkMJM+jdq5r9N366MjAJRmcrRFpF44eEVxMrZoy
         6VsR2QT/76IQvrFWppgWVS16BEJWXkqfLqQmjIr3G05Bx3MBw4V+kq9edmhRy7ooEmkX
         r86pqPzmuog9A38Amt+ximx+fmt5pYsbQSvlim8rKnL1klQAIkx8XE6ZCBXftqhN9BXU
         s2ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789556268; x=1790161068;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Io2ravhkOMIcfAcfh4SBgZRpLjfHYqw/T1gKpXFQEN8=;
        b=hpB+bya7bXX3zEUcWlEmuCPQYeQ9fatt7Ut5EHvk7biBKngRauj0EwsuQ6fjo73Wy4
         KLhnxM0UPgkZLrqC3CTaAKw4pCRvnFL8chhRNAsQRp63wRJ0LWrhkMM6+LamiS+toVhz
         f3LT+3coVbFDrOBsN2FjGBwu1FI26nrdN+EUuGeIjIamtRRDCDEUcpz5UkJNYbL966cg
         7RDRUJZmv5NUxwyGt6f9EyuIG/q7nyzVy99PvgynnzTCh+QhBxq8Guf0SYuuaD7Cni2D
         PgwSuxNvfC9uJZaku8S4DBa9Xcg8Hagdvrj++SpO3EEt2wH0cIIttOLTVPH8uPKPuRi1
         R3RA==
X-Forwarded-Encrypted: i=1; AKwUvBzVIlvDVeRuO3CBp0ZkB6HQSBsk5M/3Ot+mvjWoSlwnfXQey4Wl9YurunSU4k4I2Or9DKnfYUvJ6sU=@vger.kernel.org
X-Gm-Message-State: AFuF++m7+BibaBLM1wHqZE567xu9XmDUpZExDusNWSUEsjvjSvp08QdR
	voIAiMVX2jLL0lO4nPfBPlrDvzHdqyKp88pTv0tNrOFoKqnUwSRENuteSjR8yW0EN6wIzyn3FrF
	p7D8MQEIqBYaFvrtpwnaEXGqc/sl/rJKtswXJpP0wHiIyYfQ3UwY0H3o4iWHyhtU=
X-Gm-Gg: AYBFou3qmCNY/CDUUVTf2rM0i0CRXocpbE6az+bI92UnupO8mVpWlttzABf5pgMOknT
	TFg9wMrzGqE4kvGxqCyyuQe1oFb5mmvrN+Jes2ZOyy4hiZ1on1+AXOxrIz1HHVKQGAXUsl7HVdx
	ybdXWmNni/8zPLQ+FFExnagX1Ch/b5yfu6eVCJr8JbzNfr8Q3BWMoBiMCf9V1v+Xiyu//bCAPJ4
	/jCoHcBsNhvKdtNnveQaEzoFGaN3HSRZV1eLW0tt+DLrHL/n9KFF0hprCCtNLMs9B+b4RQK5zmX
	bnS1mmkmWwYAjuVQ202qwl9vgZKa2TUx/6pbrXUfpEzWKQrhVxyoNTxfpQcLJ9sajT2ZEE9PoNb
	3y9Ceu5osOxcMKJVBopHuDTwnb2Xm
X-Received: by 2002:a05:6a21:8887:b0:3db:5b7:e9c2 with SMTP id adf61e73a8af0-3db4fa35df5mr9041024637.4.1789556267857;
        Wed, 16 Sep 2026 03:57:47 -0700 (PDT)
X-Received: by 2002:a05:6a21:8887:b0:3db:5b7:e9c2 with SMTP id adf61e73a8af0-3db4fa35df5mr9040986637.4.1789556267394;
        Wed, 16 Sep 2026 03:57:47 -0700 (PDT)
Received: from [10.217.216.70] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5ad25bbsm6144623eec.19.2026.09.16.03.57.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Sep 2026 03:57:47 -0700 (PDT)
Message-ID: <3d6cffb6-2442-48d2-8c40-c5160c649ad6@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 16:27:39 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: gcc-qcs615: Fix GCC_CPUSS_GNOC_CBCR offset
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260916-clk-qcom-gcc-qcs615-fix-cpuss-gnoc-offset-v1-1-50bbe728f2d2@oss.qualcomm.com>
Content-Language: en-US
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
In-Reply-To: <20260916-clk-qcom-gcc-qcs615-fix-cpuss-gnoc-offset-v1-1-50bbe728f2d2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDE0NCBTYWx0ZWRfX/Z86UtdXed+9
 02JJ5u5LZni1ByIvmTVHb5lIaMrDPOtGdfwcuhllNZ9vulOzS7tzFPYCdMn4utscD5niUeP3BVi
 PGQXHsQoQu7UuUV3ySEvlhCc6KQPRSB0BF81plAp3GY1mqECEUn+2XBXmOk8NazIrLGge/u6Is8
 cca4w5iLnDsEer1uofhcqyTU8gOPV7borwIem55RjohJPqpZV7yRfU2VOm+8Ii/otKB0zE8hBHy
 qOcc/cac0mQxdXS9KpE6s2YD7ICluFZGPiabfo/EbUSv+BNk269T2CNZ6eUo+vv2wMiQn42oG2q
 JtD4y7aL8sy6GdZ6zNNi8Eqvl7FzVVQVbE1+u6SNLvNI35W7klcDoJPid5yzdRggBp6f84+Pg5m
 rmx7huVsSHqbuayQYrWfjT/HmU84f3H54o2NHQRDo58+wEpPu2QhmK2OnM91QKNOtTqLL/YZpR5
 9wRb2nvrMkJds91Yjug==
X-Proofpoint-GUID: e122NnUSNc1AqXvaKQ-huk0uk5AZ_R4G
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDE0NCBTYWx0ZWRfX8tgrTOo1NZo+
 yaVx6oYRhwdnK9CNM6GKox1SJmejiD1DQr+teSWqUbQwrpIKwQniooBWFLcKARYeQoIcfNFwmux
 eW+q7RIo4vVdw2vmd2TOq7vP2f76p8o=
X-Proofpoint-ORIG-GUID: e122NnUSNc1AqXvaKQ-huk0uk5AZ_R4G
X-Authority-Analysis: v=2.4 cv=F/DC5ahN c=1 sm=1 tr=0 ts=6aaa762c cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=UlBIJfxCiRem9hGYObsA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 adultscore=0 bulkscore=0 clxscore=1015
 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160144



On 16-09-2026 03:31 pm, Abel Vesa wrote:
> According to the documentation, the offset GCC_CPUSS_GNOC_CBCR is 0x48004.
> Drop the extra zero, otherwise we land outside of regmap range.
> 
> Fixes: 39d6dcf67fe9 ("clk: qcom: gcc: Add support for QCS615 GCC clocks")
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
>   drivers/clk/qcom/gcc-qcs615.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/qcom/gcc-qcs615.c b/drivers/clk/qcom/gcc-qcs615.c
> index 57f8c80c6f32..1a6a1e74e805 100644
> --- a/drivers/clk/qcom/gcc-qcs615.c
> +++ b/drivers/clk/qcom/gcc-qcs615.c
> @@ -2999,7 +2999,7 @@ static int gcc_qcs615_probe(struct platform_device *pdev)
>   	qcom_branch_set_clk_en(regmap, 0x71004); /* GCC_GPU_CFG_AHB_CLK */
>   	qcom_branch_set_clk_en(regmap, 0xb004); /* GCC_VIDEO_AHB_CLK */
>   	qcom_branch_set_clk_en(regmap, 0xb040); /* GCC_VIDEO_XO_CLK */
> -	qcom_branch_set_clk_en(regmap, 0x480040); /* GCC_CPUSS_GNOC_CLK */
> +	qcom_branch_set_clk_en(regmap, 0x48004); /* GCC_CPUSS_GNOC_CLK */
>   
>   	ret = qcom_cc_register_rcg_dfs(regmap, gcc_dfs_clocks,
>   				       ARRAY_SIZE(gcc_dfs_clocks));
>

Reviewed-by: Imran Shaik <imran.shaik@oss.qualcomm.com>

Thanks,
Imran
