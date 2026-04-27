Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D04773B52FE
	for <linux-clk@vger.kernel.org>; Mon, 27 Apr 2026 13:13:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777295622; cv=none; b=VEiM85bDZrL8YSh6ifqj8Kbk1NByJEGRtHqJqKshiXJHsvMfGJXr732l40ehoWoX3XeBbE5SwqtheqOmFgpXkG4SwDj3s5SVgzIXkWk0PpJwkMzpCdISx+cA1Q2d+BXLqByqUq5huOc8sT0c5OALF0IU7PcEKj+eb0DkAqBhG0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777295622; c=relaxed/simple;
	bh=KezrkNw/+lmUoQNie1EY/ZMHhVdnXfaPf2VEJ9cEo/8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QXvzmjgPuYWgS++of9WGyw9RhqZKQZO2phujksj7ZN2cNeoTCVB55QA1iE7nw++AgjLVp3Zxa9hhk16wu9IEnQnAOMoxDxGtacI/Ltz4RbTVCK2TUyrShzmZOqT/D4oQM+5cNnIAysTC23YTCKmwFFrSwiBVEaIXaBFEtJZKv1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q/1r81SI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ogk1Uly3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q/1r81SI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ogk1Uly3"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63RA3oVC3123629
	for <linux-clk@vger.kernel.org>; Mon, 27 Apr 2026 13:13:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	s3iVNUw12SY/X8URiLbb1cnOLSTbe21tBccpKnto7BQ=; b=Q/1r81SIHBKGczY8
	zdRb4t6sOXXPx3fNhFO2/xgtH1U9uCWmcvLC3IcJ0JRWHo+jsF5pLJANwhJ/6Pp0
	hUZIvOcQCkWXj+ILELYT51emAlIZXTr/aBByLFxr92ay/pQHAXAGzhdnepSSkx8G
	fpUO/RAT6+V94Odn0prXVJtlp8mdyMZKk0UUkA/QU6mwK/Hzn/noCAklCvLzNAUe
	S23Zz4sc+KeQhREQ863iVVSl1dh0lk2G/s1JfCqF6f9aOb+gN8NxVtZ0mcymyWnF
	BkYIJOMTqVBFGHAISfEiYNCY79CLFN4oFL7HAFzlPyTU3boygqN7wtGmCrUXlI2T
	zRgUIA==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dt5qggnpg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 27 Apr 2026 13:13:39 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-56f8ab191c6so707633e0c.0
        for <linux-clk@vger.kernel.org>; Mon, 27 Apr 2026 06:13:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777295618; x=1777900418; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=s3iVNUw12SY/X8URiLbb1cnOLSTbe21tBccpKnto7BQ=;
        b=Ogk1Uly3JaiC5b2InrqvkANznJ6vHGQaOt6qp7Ll6CRd4qDrudIHzaZvOQqmsrfJfM
         098DpbXx++Bt6IZFB6vvN3Tb3d0ggq9NuCMpSvxhFasXmYdaYQARZ1Ty9qCclMSamSzQ
         9kqkVHl4CWIQOuCWz25/N3MYY9gJgwQKJgaglP+VSuJFrP3SA2j/y+/UdYrnUd97moNn
         hMKBvAI1RHH929H85jCDJA17gIOuM1ltYy/KNY/yCVP74xfMwJ+IKaU8529a+wjj16r0
         fCTJkSvuf5beGnkYqBTnIk6o75TXjkJaXbBu/85tG+ic52OprVRpu9p1Qxcjv9jVVJsA
         y+GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777295618; x=1777900418;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s3iVNUw12SY/X8URiLbb1cnOLSTbe21tBccpKnto7BQ=;
        b=eTA0AWvNY6E8ynPvAqPb0gVRu9SYsQA910btNcanGTf89PsaE0S5vTMRZHP2/sktEl
         tXuiOPt16T2vNDMctZ+ajM21boBZQPiwMenQfkw+OIntVq+cu1UUzpJUBDEHU3ddelzK
         ciXvIf0iJa8yVgV9kcq3wOrsmFWGD+anVK+8taayHHVybBxuVbene7RhOTq0mpit+iK7
         GBmDSgfXYxpmDNKK8TZunjSXm6aSi0DS7OR78l8XYpzVM8f4XONLuEqjHwXxLEvp9lb9
         MCgc50zDzI24dGdDbkWY4zDeIzmyrkcpjKsY83jMjP/4oNUVj+fb7uJ/i/PWWVcp4JC5
         M3Yg==
X-Forwarded-Encrypted: i=1; AFNElJ/pFKOYwUYP9vN0tRJzVnqOHKbMOBBxHLPT10sjggP0auXHNXAfrEqroGItcPkKtwajM4JdTJ00vCg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwEsPgJJvVphJLug2pJgVtZbwtVNfojlII1dZttkmTwEcvSGulx
	C1ruVZjlIpNomkmNnu0j+Cyw6SX916XtAjX2pKXIw8kB+FqzDrLb5TWAAfha6/o22FGlk5NWDfR
	C7GS1PNd9bmzl8HzsLyHYcVG0OZhsfwGcQB3mRUVFlucSmCmkCkeydweuZE13+aQ=
X-Gm-Gg: AeBDietUt+wmIFAYg3PXCLUPAASSfeG8OsvlO853JYGZyoEE7sWe7nyewRvaJiTmeNt
	JWm7qQ/6o/TSLEeN7GnNyb93L6CrClXsBM/eISG48aOfXGD0sim5WwRNga1uq6Lv8Q3sgXHcs7F
	+E6yGJxnexgONxWXO7AF7R+H+MacUSRYLtZsxUW0FXMrTVhNNLfkU4z/HtQVGzn86jbCR4Ct0Iz
	xK/lc8yHoOXYLrwhOxE3x54zwX8zVZ4xnbJHEGWsO1YEBO7ASDWcpsLau0sgPngg6TIhiq+JAv4
	1SFThbJCXe+XOARf2P0uneu7SCIZkssbBUqGKmlTWdEwUWRw3ezEnLv1uU5AsWz+mU8DZhM681V
	8CD21F6vgVPQ0BQk404MsDbAtGGKGHrDsge8yDiJ43SCVeX+H0VL+Bz4pnvVprZJRu00OKDYjsY
	7hSw0pdZxJPo4/Fw==
X-Received: by 2002:a05:6102:292a:b0:602:7589:6536 with SMTP id ada2fe7eead31-616f4c5b722mr8143758137.2.1777295618074;
        Mon, 27 Apr 2026 06:13:38 -0700 (PDT)
X-Received: by 2002:a05:6102:292a:b0:602:7589:6536 with SMTP id ada2fe7eead31-616f4c5b722mr8143744137.2.1777295617483;
        Mon, 27 Apr 2026 06:13:37 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba4517ec776sm1140081466b.16.2026.04.27.06.13.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Apr 2026 06:13:36 -0700 (PDT)
Message-ID: <b8cdcf95-7fb0-4d53-82fa-c7d1e986af92@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 15:13:32 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/6] clk: qcom: gdsc: Add custom disable callback for
 GX GDSC
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
 <20260427-gfx-clk-fixes-v2-1-797e54b3d464@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260427-gfx-clk-fixes-v2-1-797e54b3d464@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDE0MCBTYWx0ZWRfXzfmCg+8oD1Of
 Q14Gay3/789ZuQPytTRGkZzhgwxWzuql1oGZGCIHV0L+RQ4utPS8YuSjF18rCGHly2gTrm6o9w0
 2SE7hiE3m7IuOoWoUrw6eQIcspEsPceGBwqD2I5aSjg8wxWSeM5AqddAYtDZMPFomRMkloHZqP5
 WDSayHW/SobS9Lf+GYDREfXR4gxwUkG8QCyVv2Iw7Guaai8uPue6xlJgdjvT5b+VKomlVUsSvjy
 8tkX7m5uOaEjNXlJ16YP+Tp+1J49yE1POvUYA5ZH6akYIAEaVmsj94ZksR/XLJgFCVuxH2ie5YU
 Aj+Q+g06xFOC1Y1fd8PYYyVN5bfqd469wuKcb59T65QJFnW/zxfQqB7NGe9GG+SoENyFIuiJPxK
 KQirrJX8EheBJ7UxAIvpGWiu3M5dJ7NnG7oqkq44A+Tf5kOh5P8VyaGMuB2BCro5GhKvLysTg9/
 gIci8hM6j/xLkZvP9OQ==
X-Authority-Analysis: v=2.4 cv=V69NF+ni c=1 sm=1 tr=0 ts=69ef6103 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=aB4qEwVHbqlS5mOuu88A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-GUID: wY4zXSIY1xNJVEc8iixyMPDsglEK0N-3
X-Proofpoint-ORIG-GUID: wY4zXSIY1xNJVEc8iixyMPDsglEK0N-3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 suspectscore=0 adultscore=0 spamscore=0
 phishscore=0 priorityscore=1501 bulkscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604270140

On 4/27/26 8:38 AM, Taniya Das wrote:
> From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
> 
> The GX GDSC is a special power domain that should only be disabled
> by OS during GMU recovery. In all other scenarios, the GMU firmware
> is responsible for handling its disable sequence, and OS must not
> interfere.
> 
> During the resume_noirq() phase of system resume, the GenPD framework
> enables all power domains and later disables them in the complete()
> phase if there are no active votes from OS. This behavior can
> incorrectly disable the GX GDSC while the GMU firmware is still using
> it.
> 
> To prevent this, implement a custom disable callback for GX GDSC that
> relies on GenPD’s synced_poweroff flag. The GMU driver sets this flag
> only during recovery, allowing OS to explicitly disable GX GDSC in
> hardware in that case. In all other situations, the disable callback
> will avoid touching GX GDSC hardware.
> 
> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
