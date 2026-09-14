Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 818BC44470B
	for <linux-clk@vger.kernel.org>; Mon, 14 Sep 2026 11:23:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789385006; cv=none; b=klhHnMOnuQzPyd5MP7WIovYiGt7NOWL3cfK46IOGsNDC2wejtEVmHyh3Y7OHMnvjluofPTPHb+wYjhxSGs3dIqi0q9nMJBXps5JnpsL113eYBvaSyRRMMXITTUHFp1z3exsAsiY0HFtgH/VFYIYfzYU50Ien50hZwylPewd1CyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789385006; c=relaxed/simple;
	bh=9NTdtJ/TSp6i9fELQDWEuFYvwbqy3ev3R+H2YTC2xv4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E19aYPJkRpjOoCazxiTomAnk6KQrv79NK6l24KF2+Dpy33CoGlIt2ZMGNKkB7WIQDI0xLki/9LSbiWqgvoR/ppZNHka6iZdbsjc+Rs5CLsvn2nNYYLGSf9hLwF2PKi7Q+/rnI0hs9EeIN1HRnzbBdytYReemfUX9c/8nC9ACaAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E/WVOCmY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ht9320d7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E/WVOCmY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ht9320d7"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EAmhss216191
	for <linux-clk@vger.kernel.org>; Mon, 14 Sep 2026 11:23:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	C99yA2ahM9Y0TtIpiFt1fwPT2Pp5VWgJygOu7Ai3npc=; b=E/WVOCmY/+5Enkgw
	YEeOQ9dPHJUB8CWxTR20yFYOlY8UkoMJaYfEbZw5mtWvnO47B9tf1wMQPeafNwuh
	wcPa+7jFxuwllxPm+71b/159YFvZtg/2RACZvfhGXsdX3lRflqfucbjNfAT60rpW
	nT2W6tgRlLZN6L+MSJ/TNerjJkANtic5DzviOrYF00TQxSgNoyEqEGVr9kcRPO/3
	gIuOu7yV0ud+xAE5Z0o7WnQCbf35GMdm9FpQLiSsBTvoxEBODy0Mr28DtrxMTC/P
	1BajQAshRn13edHqPJho+jbGH0cD+CYPJc+8jjhbFR5E60BgJZv+Py3P6XJNpBgD
	ZRcYpg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9ded10-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 14 Sep 2026 11:23:23 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-930a312222dso32873185a.2
        for <linux-clk@vger.kernel.org>; Mon, 14 Sep 2026 04:23:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789385003; x=1789989803; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C99yA2ahM9Y0TtIpiFt1fwPT2Pp5VWgJygOu7Ai3npc=;
        b=Ht9320d74kpNIcVyo8Quf80aiP5sRtcR3/0wQmYfiFriM2hhqg1Xc30rzDlEyoNYFM
         uRHd2FRjQOZ1zCgRZ5KOqYEbm4q68H7RiwKLBhVo5MofTGjbi5NYvFfajGuSZoDZZTw0
         EPteeyDnHje22gRYbYKCuMNAsdLLXRiLdZbW9nTjGVbPMnkkOMlD07nTCUCIDy+qe0U0
         kuujEZJb9EXOnBkkLhL9clPNrfIHSDWucD+E7UJ6NFZpQTBhIGV5pLX9PI/safMHVzv/
         D41HwqyG3tb5J1PXgemorUDx8cIj40aHjlwKE8Ged7XPrzV2qxiwtdL6OGmuypDNXRLZ
         Ahjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789385003; x=1789989803;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C99yA2ahM9Y0TtIpiFt1fwPT2Pp5VWgJygOu7Ai3npc=;
        b=J22zM5jJbMH/wRs7LcHNqyOXUpnkhLu3fNn1lzkB2fD9hEklu2BjbNvv4be0MC5jxN
         WOdbz7B2OgYMN8oJSBS5htifoAKWmyBZj9W8I/DtNsab4ZG8XbauAOAbic8y/XNXhZG2
         it3/jJFbfjI8459GxddQKB4aryI+3It17wcnvSyAGZRfS7CKIdk2Jg6PfuFnBWqifNin
         lksGPCSLEYoTxv0NLzr3fD2n7W/jRZg/FcYfjbMzge7zQHSdSDPcR25kTPUjNGa9YAfb
         13JfHBv0ASkpB70MNgeLV2CxLGw1SchllsKfYRUiaRCorEPdRhu9z91/YWB9Wvi9lYY6
         YJlA==
X-Forwarded-Encrypted: i=1; AKwUvByyiBwYiE9ZAUUrn62ekxhRM7PAwM2XubUkMYVi5Vf3M6jbP1HRyqJyTk9KI3P9vICiSCP9j5lG4LA=@vger.kernel.org
X-Gm-Message-State: AFuF++kZchKdnkSo8rjilH32sHxe3KFOG5MU5nkJNpmcwP47VFYyOK1/
	Zi5cTJvgjX2mgopFfmHnjgqk8iGj++fHxg31LKgkt/B8WWIvFyh+zQr4s7Qch2fpE64A1F8J5nN
	s9n6feDIdxKSj2uZO1D6AS0jOJBDQ08jL0L/mmpIwlsuyVmubHrhJdoDkWl4ljXs=
X-Gm-Gg: AYBFou2G3bh76Al0fGg8Wd9dRXFox5FXrB/etvn4ObSD8Fg1AjaCoMWTS/MtQZkSfut
	48meXFbaZlvvEsiCmSa2K/4hJ6mliHZue/3wI/grAtiZqsH7SNxK8oAjrHyU321GjEsevqYLq0X
	VLuWEO3UZkHS0HOw+Bx6u5Crtt2OuzATrnLzFcbFMUUyf/7HzhY9LV8Odak1rJoDLxG16yMvYHr
	aFLFJ3Phk/Ru+JqpzLNyo4kgkYdwWScDsKU5VBraNP7vGkGbFqMCKW1IUdtBIKhZQBrzpLpfhjx
	9LcZD+3G1Vqz9iLZK6ZENEZmtOGIAz2MviaXr1YTZSQRjdc3iQZjo07/YF+R6YR+8mwJ0DS8z9t
	H1/YrvqWcbntrNK/tUZ72dQ==
X-Received: by 2002:a05:620a:4555:b0:934:95d9:85fe with SMTP id af79cd13be357-93a29a8d250mr214252985a.3.1789385002647;
        Mon, 14 Sep 2026 04:23:22 -0700 (PDT)
X-Received: by 2002:a05:620a:4555:b0:934:95d9:85fe with SMTP id af79cd13be357-93a29a8d250mr214244085a.3.1789385002074;
        Mon, 14 Sep 2026 04:23:22 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c296601f4ccsm406660866b.20.2026.09.14.04.23.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 04:23:21 -0700 (PDT)
Message-ID: <757e124a-4c7b-4d3b-b73f-19e7e39f2677@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 13:23:16 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 15/20] soc: qcom: ubwc: Add UBWC config for MSM8952
To: muzafferkadir@mainlining.org, Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Lee Jones <lee@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli"
 <gpiccoli@igalia.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: David Heidelberg <david@ixit.cz>, Dang Huynh <danct12@riseup.net>,
        phone-devel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org,
        iommu@lists.linux.dev, mfd@lists.linux.dev,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-pm@vger.kernel.org,
        linux-input@vger.kernel.org
References: <20260912-msm8952-initial-support-v1-0-0e742578b524@mainlining.org>
 <20260912-msm8952-initial-support-v1-15-0e742578b524@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260912-msm8952-initial-support-v1-15-0e742578b524@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE2MSBTYWx0ZWRfX2uq4Gzcn1Mbk
 YEwXvODGzJbVbMtm7cOEJbviJG3SsBUoTjExrtV72rK3ygZPpBb5CRijrxOm+kyRZwlWl0lSCM+
 TNiQA+iam4VAXejEKU4+uTSGUCHwXljvuz+/3p9qvKVJ9DROd7x+3l73aOQhsN6KQu3lXiPHxSw
 s4WXSXmfG5td5aRevtqvDCV9zvN4dxbdmRWtGsf/OZh2aPcEyGYTfQjaaEh3UVP/A8a+f3TfPxa
 FjuS2z0SaZRBbdMzcLShImV0zYC3Iq69aWk5/vKKiqN67mku9rD7VgJH+QEkMrb6cEoYdKHnkRa
 Qy8oHCCZ7JPhW15uAZ07VrNcpRiZONvHg/vgDvIaHbRgis6Ms0cAjFobI0jAf9LzZgufrAHQ7aG
 fV1GJ7YlYeaEey3L77Z6D8MXQ4zqgG60qOP4nLU08NCYXy6C5QfOSfy55mpZkXgeIH7R+rfjdZW
 WSIc84+yHqJBwWo3kSw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE2MSBTYWx0ZWRfXwrbOUY4dZDfG
 hOymZ7Bkm6hi+WgW0m+SSNQ8iNnWAt2+68xrAK+cEF+ZgeiPlTMHHq0Y9tuu3YEvihMjrI6uJrT
 eik9o3hQDmH2WC1gIpL7p5TO3ZK08tY=
X-Proofpoint-GUID: Ek_jyz0aBgeFWqz2AoMW0ZSeCNGIn2nH
X-Authority-Analysis: v=2.4 cv=OeUNnRTY c=1 sm=1 tr=0 ts=6aa7d92b cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=OuZLqq7tAAAA:8 a=EUspDBNiAAAA:8 a=OvtQcJRYg_U4C0nSOkMA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-ORIG-GUID: Ek_jyz0aBgeFWqz2AoMW0ZSeCNGIn2nH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 bulkscore=0 spamscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140161

On 9/12/26 10:39 AM, Muzaffer Kadir via B4 Relay wrote:
> From: Muzaffer Kadir <muzafferkadir@mainlining.org>
> 
> MSM8952 uses Adreno 405 and predates ubwc just like MSM8939.
> 
> Signed-off-by: Muzaffer Kadir <muzafferkadir@mainlining.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
