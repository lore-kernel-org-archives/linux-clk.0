Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E900F279792
	for <linux-clk@vger.kernel.org>; Tue,  7 Apr 2026 11:01:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775559711; cv=none; b=fzxsYeQqIH1POux+C7rSuvKxfR6SkOLKpCli5BBjhmx5A8yB6hflB8SFVRtQkmDZ8IdXZ5TEHcOXUCl+wEoxe5h+OO71A0s28Jkf/Atx0Tb++1nYKZ+7iYGWdHCe6GVjRoO1+MUQpzUAt5Xph2YwfZYWMSrWfoJ0hREg3f/6Xek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775559711; c=relaxed/simple;
	bh=PRfMWoutDU3qCviTSwUd8osHVIFj53AMYp7AwheFkjw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=i/DId4pSxjs7G8wKAR6bqe9VQzp5DacL7qWWd72UDIYzjYsdHuNc4TYQP5LvadxDXRtKKsxDAyq20jNID51pqWOGz7WXeKwmFMKVclLemi3dbotEquOZChg0nxtpmRKYtCXEYrUVro+iQ77WJi/ABeGZRHW6U8ur0SQDK4AX/H8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OwN1oKef; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LNM9k+dS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OwN1oKef";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LNM9k+dS"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6376erY31406934
	for <linux-clk@vger.kernel.org>; Tue, 7 Apr 2026 11:01:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TPg48ZrFVKpUfD5wFgvADPnLL02fzhqooYDzb16tNdY=; b=OwN1oKefUvSbIOYy
	SUTDm2WbXTfHmxhx9/W9uTDnYFp5zgxbvd52fUs7n7rFxZ6nYeOMQfpd/osoky/7
	jup2fepjYeVXkEX+OpeHQcRDEp66x32IWeGAAAxnu0CziubaHUVw4Bguo3yZRp0T
	W7IlQtgfrWQc+gCtJbNV1b3sKOiIpxjbdRwpojzN4rAeopR6sKnZO+oQ7EUcvH4b
	cBrcxw/Q7SekvIti1ggoHVpBtwQXKNfHIXuLgS9dqIFtf66HVKklJYSUD9qBux4a
	X1GA9KN5f6u+Gj5q0m8E7MWvrDZ495Nrzib5E704Ae4MXMh7xHgxWfY+VKXeJtZt
	Vb+nJQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmratcq2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 07 Apr 2026 11:01:48 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-89cd541c0edso27555456d6.1
        for <linux-clk@vger.kernel.org>; Tue, 07 Apr 2026 04:01:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775559708; x=1776164508; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TPg48ZrFVKpUfD5wFgvADPnLL02fzhqooYDzb16tNdY=;
        b=LNM9k+dSqOCcBAy2Z54tFruIPQnw5gASc2a/4WwSmCt292tM6DItT2ZveKk0jEgYhK
         ZvwH5+fxGkymiiA4JF3iOrLF9cm70K3oJAbPMAqn8TTYOVRC2SyH4PaFMf+zxkeAjT55
         N8mS95chsODHMhEPImPNtix/737tVjVLKAXtdUw9byw/4W49f5nH0OJepnxhT6emksm3
         LFxyLGVIKZUVKuWgU5uJ6vT3XXig8fYvYIBF2TrLHYmjKWLHDIFh1W0FSj8c4OQoeO/y
         woG04FqKv+YzMM8wuHjBWFE/3wrneHMfIp9KFrIQRG7KBw+E4JJnmEEFa1OyydDk8CiE
         9iIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775559708; x=1776164508;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TPg48ZrFVKpUfD5wFgvADPnLL02fzhqooYDzb16tNdY=;
        b=j8BEpFE2t9Tqpv6fdxb4Ia0mFDlG67rMbscNlDtfz7VCRfuhOWGbya3ZcWsovK9194
         oyW4zUVLbbey+6N9dqOxoqOKUivgEctGPdD5YyjQPDimhxLu6rAf7TMDEGDUUxfIQ3SP
         fpwmbIt7PeBfT0XnnGMAhqHtDzUJDa5hdroLmpkSkJKu0LX770AaRmB3fSQhO4P/ipek
         yHW2rxAxItggvuTiryopx1gQhk4/v55XoTtgr2w3JFFsDi4thVbRrZZgQW0E2liyY528
         XrMMwE7x3y44o1i7EdltZr/28aHgjkUtAl1yi975l7ezQxSuS2cp2R4sfJw4Qls8u2Ck
         xX2w==
X-Forwarded-Encrypted: i=1; AJvYcCXsUXUbnVCy1VZl32XqI9MJseDxkkV4L8tSskX+/9n9WaxJjOB1w7m6OL/FAZ+OHsSlGvDX/ZZi/h8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxd1bWtalDO81vqD/3/ET8B45KkeTYyZFHaYyCJy993LkmlGSk1
	XWR899uPDrOGS0NpRAkSyKTQZsqPN2IM7OdMpGommHAwC93+kxI+amFHfW5MOXxdOxUzLFqoqtB
	lJ18/sMs3bGgMnC5Y/VDjzVjmgXTAI0HKBn+rI4KPLfJkcY2SySlRrxpWk/e7XwA=
X-Gm-Gg: AeBDiet/8D2cpSWaPRaNl7YR5FhrxaKwAjpQua2ZCvwJ3gKVpxZyeYxpfvVtrCWcBA3
	W9fxJdbEmuz25dMzSjsNOa8llBOvdjqaFNev9KeGsn8h2dPeqAT2zujJo4CfAeU5FOTlKa5laAl
	2FBtd3XmjJc+6UhFoaFB40C/qhUFlRb4iHdceYXnFNj1gc60LUQ+osd49fZ41PgcnenMhEe6/1l
	8rPVY/0mHS/IX395LLFUmWNBoUhyZwp0dJHLeS75XOujJnBNw5uQmQTlDYYlxaNTYFn9PZLWOVz
	Sc+U7T+RNhcyv6tAU7tg5QsO8N3ZV7rkx+DxnGZ5bU/nnQMUdE6LmRtI3xgcRJ7Vn5BRuCrvcKU
	hTB8PwlHVAXwvheresnHD//pv3cOcwmhzNrTwXAPJZu8BWiRamFyiBR2d8qglt/KUSTHmbGxvzk
	ev/Pc=
X-Received: by 2002:a05:6214:226d:b0:89a:46fd:3001 with SMTP id 6a1803df08f44-8a6ff3c492fmr183299256d6.0.1775559707660;
        Tue, 07 Apr 2026 04:01:47 -0700 (PDT)
X-Received: by 2002:a05:6214:226d:b0:89a:46fd:3001 with SMTP id 6a1803df08f44-8a6ff3c492fmr183298836d6.0.1775559707102;
        Tue, 07 Apr 2026 04:01:47 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3c9721b6sm532205366b.10.2026.04.07.04.01.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2026 04:01:46 -0700 (PDT)
Message-ID: <8f5ffecc-007e-4a8a-9c5e-9994e7841659@oss.qualcomm.com>
Date: Tue, 7 Apr 2026 13:01:43 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] drm/msm/a6xx: Limit GXPD votes to recovery in A8x
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
References: <20260407-gfx-clk-fixes-v1-0-4bb5583a5054@oss.qualcomm.com>
 <20260407-gfx-clk-fixes-v1-6-4bb5583a5054@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260407-gfx-clk-fixes-v1-6-4bb5583a5054@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: DUXLMiuvlpyKZzHQuatusdzOkkcdObHN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDEwMyBTYWx0ZWRfX65fYdvXITkSH
 qOq/W78uv0row9E17cXPrNmAkvgAh7pzLyUngS8OdbQO0aHqUVLhGLqAU69dBgkvaKZlNhl90WZ
 WoZhqQh33GkxtxnthWNQ+09Dqprlo8NXHnpzILhehG7wlau6TnQNFmMk9M6pHGbZgKNrhYiq2CK
 vXcyJt9BBG58FJl9WYJ0h9ScWPug+1hpmtwLL/wX5cu33L4T+O0vrEr8qVALc20N34MuaUfUQMB
 fL+KFJ+CoW2Y6WSdRU5IQ9jN3js/DX+qNqDvvETmUkPyQxb0aForfs8T0kwGYtpNhYLjXSFfBAN
 fZmAQd8UBl3WAB/mxfpq74h4Wfu70xarTT3Rn9vyW1x/2Jvh1UW6H5abwfoRcgptyYsbGBTy3id
 9grGQGs4IqTinPOz6PayTQ/PJOCq/Hy9YYEnmhvVJ5v1RmX7MynXbLoca51/efJc6Nzg2LUNOI7
 MNlgFffGB2i+5E1I+Ug==
X-Proofpoint-GUID: DUXLMiuvlpyKZzHQuatusdzOkkcdObHN
X-Authority-Analysis: v=2.4 cv=D/d37PRj c=1 sm=1 tr=0 ts=69d4e41c cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=eR-y9ft8gFT6PtJfczAA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-07_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604070103

On 4/7/26 11:30 AM, Taniya Das wrote:
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

Can we simply make this change unconditional on the gen, so as not to
maintain 2 separate code paths that try to achieve mostly the same thing?

Konrad
