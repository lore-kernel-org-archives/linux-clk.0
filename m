Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4117C328B47
	for <linux-clk@vger.kernel.org>; Fri,  9 Jan 2026 09:13:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767949985; cv=none; b=syOsVyOYQZ2ernJdfN0EGSu/vP6r7QLOj18gzEpnHSpckT770BWS1m6s7isZZcmhmFCpXb2ik4zx0Tgvn6AAVZYhKWDbO+aD522s3AH7pwoH2M4AieZp9zxhAtsJT5tq76hiQ/NcArZynxWTg/P2K+ulE9m+dcGF73Z7vxNw/po=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767949985; c=relaxed/simple;
	bh=2PyzJYzP0Y1RqWMp6rzac5wFiZQD1KJFspE9qiO4mhQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CdMxSzL6eJD5Af4nBm2SkeficXl/RLYL4fGm/kW0f73MrqBfGcurZHTN8l/whEO9i7VlnCxcnB8aPyTIT9nSr3eE2J73ZvlYQ3GI0R8GzwjY883dJuGrPfnhfCPHbkcvI0Rwo0jRV4rnXb2NclpOel4IFbfvjwm3BpXpnW+JPvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YxoQLUak; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EyGqgbXR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YxoQLUak";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EyGqgbXR"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6098RA862327455
	for <linux-clk@vger.kernel.org>; Fri, 9 Jan 2026 09:13:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1P93m0XTzLapwNrcaQ2biPDhM8Asz8miZJjKBvF7vq8=; b=YxoQLUakCVzeOh88
	ZqaK/OwdfAOF9sIZtVbbMX1FqVVQRdPVRy6AA/h/jNUsiKRnj8fw8zBmyc20k/3I
	gfkZ4sE1wlKql3l/BpUpXDKIOrSKKYiF0bxso7vZcnl2zK4Dx6sYxeoBprpe+IYv
	RQHzKrsshZaR4ZdtvawBNBJtgtJKWtxdvuvqajbUJeSATPZNQTMJ+jfGqbDhBOwF
	KKl8qlzD3tEo1F9xwTZimAxNBOMMUfd2DtakIxa3FohJyBz4F3KKeWAtN/yqxv8b
	8LFSP/Cz1LwjmALIpsQLPUuu+l0MYZMlZly9QTGkSyjKZmMziEKrB5X1PPVqJEKc
	NMvsKA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bjfdaar5d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 09 Jan 2026 09:13:01 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c231297839so135308485a.1
        for <linux-clk@vger.kernel.org>; Fri, 09 Jan 2026 01:13:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767949980; x=1768554780; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1P93m0XTzLapwNrcaQ2biPDhM8Asz8miZJjKBvF7vq8=;
        b=EyGqgbXR+tf+C3Ppyhi+xAqmrjQ5yFfo+SUI6X0s+GWxNT8CWBFbZtJtWKDS7iYpl8
         RJtn7tHr24vwaonyTu6vQHzKUBTQXYs5B4djKKfKrnDHy2Fadn6u5LIwIeSZULGcJwWX
         vO/YdOqhy3KVxvDDv5QtkQtFcsfBZ+qruA1uoWXZfDxuFK5bs0EdtR6SU30Ho1jPxCLV
         3xShs1UgAgYkubFC4TLhg0qvwTpbAmcA/FF5u6SODqT6XiVjuCFD72klMDQiOjahhhY9
         DjyfEO/iNoea8AqeRgxqCCPNVTjTVASnrgsuFhDPq7lPreMCO1M0n+uJcy1BdFyG1aNR
         GPKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767949980; x=1768554780;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1P93m0XTzLapwNrcaQ2biPDhM8Asz8miZJjKBvF7vq8=;
        b=fpBeC203GvVBF+gEk0QYxhLjeR0phOURASBkjbth9yg+zaxXZrkGHHoFoEzrbNIxMA
         P89z3Y50Huin1gkQlDpqYkeY1xqjw/7EjOWSNZVfvYEWYqMpVEsXUcbxYemerr6TPjDz
         Zq9yk5SSFeHPw0PHwUS9LQgm4DWA4mZReLR+mrLHHto95s4JwUeIKGN+GKIna3ujNSk8
         MG8dOzcciSuIlEUxdbqw88SrRoxNrMbF6wFru9haTCQRR84I6x/5m/95CrP52Xb45qQE
         ijFws9URKFf7SJ+aFa/bxgplagppUVXyTJaqZzxPWFknO7Xifi324VBFAj2F4Rg7zPs+
         zW/Q==
X-Gm-Message-State: AOJu0Ywk9JXDFsSmBEBMd8EPZ/U8d2c8j2FBqq8AXoiG5PqsAFVXEG/j
	3ITehkjRgKEV6Z36BL4XkqLqxxLWF8G0vtQ3tdo0gQmrFPaEyDaKyC5I3hJ/PhOvGvhR8N3cWri
	lPAM9gIeGRtEUlR8jWH28KoKFaMcY5iapluZAcbZOoaTncUIyVMAqDklIDTaewCU=
X-Gm-Gg: AY/fxX6h8odiVMiMs42xu1Y7GDkNY6fxE9LI9kNpZ3yVOwAI2Mnk4hyO9LtSP3tCsFJ
	aGJRj+BQSn6olAeJBNUlaEnGX0RM0Afl0GBALe2ZxiODlaQj5d54bAOsZU/kyeg5ELVD7F1hds7
	rWH446YZojaixEAjLySHNNRpvTkVeeUG3/AgDU5U8XWF/rLMXYTpO0iZyutA6PoQEK1Wap7MZKC
	ERSBTgXMBBQSxDJCzYuTUtBMUTwm181M0ux/txsu5AZd4CLEBAXhjHM2qnZ43oH+GOm68dqSIte
	SA6yiI9xe2ibvMztnegO3zphHkNw7pdUCjmZNMfaDMEy3j38Qy0/hEnY0w9naTrHzQVAMPhLCV4
	KXpaChmH0FZDzRfQIVo+Jx4bvIdhiKniPjWkX8P0DfyMUziG6ywz9DvRgtdfqO19Lqog=
X-Received: by 2002:a05:620a:2847:b0:8a5:2246:bc29 with SMTP id af79cd13be357-8c3893fd6f5mr926314485a.8.1767949980555;
        Fri, 09 Jan 2026 01:13:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGeBZSG8kdSBLShp1+Wc/UybzJzIr8kq9RYBBSnMDG9wd87B0tyDpTBrTpAW7NtU14bEKYlTA==
X-Received: by 2002:a05:620a:2847:b0:8a5:2246:bc29 with SMTP id af79cd13be357-8c3893fd6f5mr926312685a.8.1767949980148;
        Fri, 09 Jan 2026 01:13:00 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b842a5187afsm1043952666b.58.2026.01.09.01.12.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Jan 2026 01:12:59 -0800 (PST)
Message-ID: <faf2dc8f-fd5d-46cf-8572-41879b3f4aa4@oss.qualcomm.com>
Date: Fri, 9 Jan 2026 10:12:57 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 24/27] drm/msm/dsi_phy_14nm: convert from
 divider_round_rate() to divider_determine_rate()
To: Brian Masney <bmasney@redhat.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>, David Airlie <airlied@gmail.com>,
        Simona Vetter <simona@ffwll.ch>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20260108-clk-divider-round-rate-v1-0-535a3ed73bf3@redhat.com>
 <20260108-clk-divider-round-rate-v1-24-535a3ed73bf3@redhat.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260108-clk-divider-round-rate-v1-24-535a3ed73bf3@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Ue1ciaSN c=1 sm=1 tr=0 ts=6960c69d cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8
 a=MmoDKESpECQAgM94Xi4A:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: EwQa11Ot-IdCCG6iKcMMbcDw2P92hbIq
X-Proofpoint-GUID: EwQa11Ot-IdCCG6iKcMMbcDw2P92hbIq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDA2NSBTYWx0ZWRfX0cS59TrKA7w8
 NjCnDcbAm5nC4OIsslTkxr0qpnOvN7vGM2DluHN0chhSUrZk9giJU7nHOIW1uNcIRn4MQc2/Agi
 jaI6RTdvUgrBjZulz9gxVjfjfr1QpYirLlhNaNnt/dQz+SWnqYRIovjyUbPVsJmJLHMKiHeEYrs
 nNeywg/9zLEP3JJxTnRtcLukzGCup0yWmUzX6ZKmoJ5yqdurVZnXdAY6QFHdD+NTVojCxWtJciY
 MmDrYDGQiZbmBPI+Oet6LAOQt1HwTFBkLmTX09JSirAwBOKwBlySNjxmYi9HdPDhoHJmRvluWlp
 gI/wxf9LCWwQJOFyVGzOHxXKiukaA9iXi4Et0d+93R9fWDnggr9cfTVkvFoDn5er1j1Otvk6uYt
 Gr7Zg44fWW2EN8Ww9Pv4a6FuqG+xEoBRS+cuUkMPYwdCzs3GXAxstaKBnI2a3kyIHDHqyHU47hA
 OeDpIaM2Vhw6HRiJ9qw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_02,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 bulkscore=0 suspectscore=0 phishscore=0 spamscore=0 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601090065

On 1/8/26 10:16 PM, Brian Masney wrote:
> The divider_round_rate() function is now deprecated, so let's migrate
> to divider_determine_rate() instead so that this deprecated API can be
> removed.
> 
> Note that when the main function itself was migrated to use
> determine_rate, this was mistakenly converted to:
> 
>     req->rate = divider_round_rate(...)
> 
> This is invalid in the case when an error occurs since it can set the
> rate to a negative value.
> 
> Fixes: cc41f29a6b04 ("drm/msm/dsi_phy_14nm: convert from round_rate() to determine_rate()")
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> 
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

