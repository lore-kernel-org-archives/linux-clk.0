Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 054AB2ECEA5
	for <linux-clk@vger.kernel.org>; Mon, 27 Apr 2026 13:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777295839; cv=none; b=etQh1qUlTBilGB4Y5um3wbDHNddij0ga9xZU3rA4kq+JGbMZp+HPpx0Dq97HJeB/g813Juo3asf87+v1USakFrgfjb6ToR4ZMDmbymgwCTT6QajM8bnto4c/H/qIO3q3eK1ke+mmIPOKb0hNhF6D0zqPa4eEYOm6jKvBiQag3l8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777295839; c=relaxed/simple;
	bh=JH17vrXPwQ/zPe5NZmHZhSOAr+xyyo9R24CTivGGCn0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rtn3YWkj3Qo9nuO6ivmI133aNnwGNFeHky1mzMJcsm6DUH35O4X6XjQvNDIL3wSH2fchVWuTBSRSP0fiQGFGzJYOX9hmmM+ITuvLbxZLL70WraEderknARIDVelGzpe7D44REFZQDv7Fc7HLnaE/5DUz0d2SwywUnWD/lkOwtu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eafwYqJ7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BYHarJkG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eafwYqJ7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BYHarJkG"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63R8TBg1665651
	for <linux-clk@vger.kernel.org>; Mon, 27 Apr 2026 13:17:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zQ20hVfh6ChaIxk/xrbKz90SjTLBFn05mgb1/z9GS18=; b=eafwYqJ7X+N7+uxR
	HIqdnIywU9Y2UwhDLXF8PCr3AOiJXIfLy0uDSBMROxVHG0DnMbw4j764Pt9eOTbm
	JlQZnUAY1gkwk4wjkg5BSMxqwVm8+5L4gk0QENcKBpaLFvVATEqYqAh3ts8kp0Oj
	bXQupf3B6rIsQiqWWzYqPc4RSt9GtazgYXWZeUjkDEZDrLvW9GTkuklA2jLgHVWX
	gJxT+lmJJUiE0InATBCObRul3i2pR717KX853O6BVR6NoM1MhOx06svUHkChnSL7
	LltYM9YiRWxF9MtgyurJ8QbR005kJLcRHocip+GGcAilGK3sClsiBd//vE0opSoi
	MEK3TQ==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dt30n1he9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 27 Apr 2026 13:17:17 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-9568c79b893so603174241.1
        for <linux-clk@vger.kernel.org>; Mon, 27 Apr 2026 06:17:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777295836; x=1777900636; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zQ20hVfh6ChaIxk/xrbKz90SjTLBFn05mgb1/z9GS18=;
        b=BYHarJkGkZCiEoWGV5sQV/zYjPCTzv00wfcm0IAJupI0lXkPjGun0VesHKpLIUtKG6
         L/iqA0Zi//YMEidLAJwANzUK7X9l0LMtPwGcTnfeoqnToXwwE9jhPJqhucc9yLWROmBF
         TVjF/ZwT+dRR9VOLkREJZ7cuRYyGQSTXPSHIoy9ElzqTEq+oouv3G9WXl1hZXuuJwAYE
         GIsrEyHnBUSbxQypNm5bI9eYlocA47+WtTThAmBDOrJC10g9CJEfquSIuCJL7etocPgN
         He76z0IvxYXzOvl3vj8hbuS7GUT32KozRkO3s2oLRNNhM8Xe1PLioPkWm0bR5bMrYJ8M
         8A9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777295836; x=1777900636;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zQ20hVfh6ChaIxk/xrbKz90SjTLBFn05mgb1/z9GS18=;
        b=Iuchbj+qUyFF1ymTWdEunP6aFMTl2xBQaNTGPX+UNoChnlsQ5nHZwToWmMpgKYo7Kz
         86xx/gmS6djE8L/UC1WVFBVNUIhIJKWM/vaxtFCNcFA7OFQwUsG4W9ogX77q3K0H6KaP
         AaxX8YhW8YzM1CJ7rJCgCiuenJCDcPdK1DrnBVIzD6VcnocB+ZRrrSzkXPehURWPngS4
         LzvXzxCkCBmn0tJiGJMtxQPB1frFERIXYpYg9ojNOmpBbJca0+hexi1eUtrWdbjDsgtV
         RMkA1Nd3FV7Oq6XQmh77WeIF06Cdl46WqF7QpFc2B8CXwmQrXwtGi+NZY82JMbCzosp+
         NZMg==
X-Forwarded-Encrypted: i=1; AFNElJ9tUKIAbMNWXC4wWGkOmdSysBcvYnc8F0C2CKVMYve3Wry9PzrQEK6yllAgPRG/v36fL6zdlw6Im5E=@vger.kernel.org
X-Gm-Message-State: AOJu0YyCD/1of3VRzYnfqwLm5i0yJb9I8URgTk1cDilY7T4W7Zc7/61m
	DA015JcGmJt1SDzc42LvVR5lHEXATwWNGC+2mDUAlvFKBoIMAHpwhF0KqG8csAJzMp9VUk69E2T
	pAQVbOCy7yUiCLv12fSlobi5VZ9T3EfDQTYrEo7p2AfpkHazHsTcwgd9C6fhJ5VU=
X-Gm-Gg: AeBDievcBfVyrcbxzgs/FTe7Jr+HVxA20d+M6RPomZUpiIstN4/yio9nA1iJM0qLZtu
	gbGNwh5jfQk35rSZzwnDzGIvmbcWD2DPghw1RdRQYrUwcUXppk5vTXyV+4CvSaZZylAHfls9nH+
	pnbMyNhYAsSULUtX/DTFF9ZdrVFjk54KqwFXw2ohkd8fJNvygQbA5SrJ0Xu8ozcOM3C5wI3l9+P
	xz49AYcMtwrkGS9IlDagoQ8vtH2PgZvLp0TI6MqepAedOoYiM9Nek6jEhxu2VujG6Eic3VI7GW0
	glgpXWDJndIE4T7x0pgILbwIxL+rRPn+J9Wu6dG1pecbqkYDWevNqlMNDrPfswo8LiHIoCuGNnd
	qO3D0+wPKx8GfQF73zO4dCycNuF1qhq73CCO2kXlsMzUTKGraXUWxRAj7bzBgm0rKbngamcLygp
	DwVy3YsKEWIuOMCA==
X-Received: by 2002:a05:6122:83c3:b0:56f:6edd:77ae with SMTP id 71dfb90a1353d-56fa55ed7b5mr8965566e0c.0.1777295836232;
        Mon, 27 Apr 2026 06:17:16 -0700 (PDT)
X-Received: by 2002:a05:6122:83c3:b0:56f:6edd:77ae with SMTP id 71dfb90a1353d-56fa55ed7b5mr8965532e0c.0.1777295835721;
        Mon, 27 Apr 2026 06:17:15 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-678974e23adsm3156526a12.13.2026.04.27.06.17.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Apr 2026 06:17:14 -0700 (PDT)
Message-ID: <4e454c14-92f2-4929-a058-3f128c901a00@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 15:17:10 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/6] drm/msm/a6xx: Limit GXPD votes to recovery in A8x
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20260427-gfx-clk-fixes-v2-0-797e54b3d464@oss.qualcomm.com>
 <20260427-gfx-clk-fixes-v2-6-797e54b3d464@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260427-gfx-clk-fixes-v2-6-797e54b3d464@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDE0MSBTYWx0ZWRfX3odH+f+O6JjG
 E9OM7HBHKsdzoSh/55+jBR1spF0oSW4C5eihXRhigt7ANnaq0ZVnkXgyaRqJ+2lT7KZ1sMYdWaM
 nU0DRryAkjYNQ6lus17zvcXcotAib0TxxqScSdc5urga83Ih7ekoIUvv1lpwTSsDuy7FftoHlW/
 aWlcObnz8F/LD7W+hw3Py0VG9Y27U5Y3gHRLaSn1J5sMakSXD9udidN2g8LiDaHYHjMNb24oWdP
 SzAlT4XbpAxBkLAZimluKX1hp9qFFKdBToNgsEkJnX7m3452GOgWdA/iDlnyFC8sMd9jpXLqtvJ
 BKyS55wNhbGCSw4XYYFJRFhY4SX8vLC/kOGKHa+4Npk9TBed1n4fzgiXITfjvCAHqwX2brKJ8gz
 TojN1OwZ5t8OSF8kirbmyH+KGttQZ3zVOumS6u2gpdTjN+VSF/EOsOneO2XchgXcjZLQr2BplNa
 CXnHB/AqRftFih+QKNw==
X-Proofpoint-GUID: XUFgPxBlcJCFafNlwMPLYE80jpbKM36O
X-Authority-Analysis: v=2.4 cv=efANubEH c=1 sm=1 tr=0 ts=69ef61dd cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=eR-y9ft8gFT6PtJfczAA:9 a=QEXdDO2ut3YA:10
 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-ORIG-GUID: XUFgPxBlcJCFafNlwMPLYE80jpbKM36O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 adultscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 spamscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604270141

On 4/27/26 8:39 AM, Taniya Das wrote:
> From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> 
> In A8x GPUs, the GX GDSC is moved to a separate block called GXCLKCTL
> which is under the GX power domain. Due to the way the support for this
> block is implemented in its driver, pm_runtime votes result in a vote on
> GX/GMxC/MxC rails from the APPS RSC. This is against the Adreno
> architecture which require GMU to be the sole voter of these collapsible
> rails on behalf of GPU, except during the GPU/GMU recovery.
> 
> To align with this architectural requirement and to realize the power
> benefits of the IFPC feature, remove the GXPD votes during gmu resume
> and suspend. And during the recovery sequence, enable/disable the GXPD
> along with the 'synced_poweroff' genpd hint to force collapse this GDSC.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
