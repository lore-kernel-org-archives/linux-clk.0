Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A12A257AEE
	for <linux-clk@vger.kernel.org>; Mon,  5 May 2025 14:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746454495; cv=none; b=FbyPD/0Xb7HxT2GcR2qxkzyC/zs5jhfeDp8llWn25v8Yulnaq6OZl6AJYa7Jq5DM+g37uEnb7STC4fpUcbP3GnxI+v/vuhIruEocYIjlp1piKwlTRe9qdNHNZ3EzpJoDvXLXC/aPclJBxOmMeIH2p8En/QtSY5MQ7oz75RmuWq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746454495; c=relaxed/simple;
	bh=g0rIMfPYox6tTNqVeb0ZnxMcXS3eJl9r0KihR8f0GYs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HCrFAEj/n01vkJvpPx5XHE6HMMx7wUMOUoLt0fO6N6wXi6YK8bWAMRD1QPfYlK9OcGv/zPnJ1ck8noWr5Cu6tMOYBAtDInTFwsbdjPdAS4ok5QmI3buL1y/XRxTKivyLXDS0C3PbtinwjjLki4fH5Q5+Zf0UlDhyKvMieJFL9Q8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ND390zxj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ND390zxj"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 545BG8TS002489
	for <linux-clk@vger.kernel.org>; Mon, 5 May 2025 14:14:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	N4sMPDgul+5aEBpACagOkB2ejQOvDaMfk9F++ofP/og=; b=ND390zxjLditdSh9
	kiFSZFnTqnxOxxGjuzKTkdXrBLm7fTfzneNq/E3ltm5M6SYwWueTLPTMBKFhtATE
	dKwrB0vksp4iEuvR7wG+pQ1Z+hT5ZFw/bAsy36tAIad2JLVUPSaj52ElDhKq88G8
	8JvwImFXBm+Ex2hGLjcyNvStD5SFg0qzBYn9X8i3V/id0XYcH+LBgFIE/ebVsPI8
	d7JL5hVjMt+Gg/7gxfV/v3CLfnnhJCo2+pQWobOYtDAwMxqw4OzTWN4MTine0DcA
	nBEVRWI9fOldTEbcyPEYwDlm3rQOvNiISPfvdXviaT/id2xQgdwFaD10wOOSkGiZ
	L9du1w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46d9ep4dc3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 05 May 2025 14:14:52 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c790dc38b4so790438485a.0
        for <linux-clk@vger.kernel.org>; Mon, 05 May 2025 07:14:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746454491; x=1747059291;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=N4sMPDgul+5aEBpACagOkB2ejQOvDaMfk9F++ofP/og=;
        b=YCJKbClvpVgcPZe+NQMvHLP9WcWIsfSgVUqa9tE/CSHc/zLh9KNzbl1N8eWHDKFrKI
         bP15T9vTJ0EKx7Z9C7MoDQFBxEZ35/2mybp1HlA97qb3Dmb7B+Lyd2h/AELAU7XpM5NI
         NgrPoWsnU5vcuiSRHXRqPArUl6i5vkgkvktqm7ZUnSEL7jchYcxp7iEowRSAMZbbeJqF
         e/hVBuJ+8ep/iG9XGF3oEq32SZ9s3qYliWACRYI1FkDeZ6dLzA5VNUy1WfE7skdLXS5z
         UKvuC7Kt3K5c1gtdLlk52acwQlfaw6/lEaVqISjOhLIU47XiSao/Kn4DqbCe2w37fLSP
         zz5g==
X-Forwarded-Encrypted: i=1; AJvYcCXxz6WPcNqd2JhQSB7FhTfjKPBha+to8q1F7maEMpmU8/nYwkQxR4gyj29Am4pHemtjxIy6zTDR3Fk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3VDTUE11uFssp0NZ05a6NWgpcB3wUNq3dvSxxEse/Gdl0gBfZ
	pIl6c4bw7d6AtYGYJ67ne8T0E0xESmNVsEUO7ONPNHd6i4nDVpJEShw4JPXQxhrOhSawA+vHe9f
	O0SQt8jdCEQ8fd7XIOYQf8g/fr6xsPLOyJg+FarkO9kWK8PPYPO4mqyCpwrc=
X-Gm-Gg: ASbGncu1HYdR5dX+FyNV58zzSZscC/xKc20qQD0Uus1E4UFrolaXqqTFL5pjhbEfu/0
	heYz1OMaff07SPt+lDEeYCHhlV4rXypbPuZ6t/9xrXK654R7EuLJ408GD2S9fJzPMvaZGURjBAN
	0EFpwVN6Ozui4XLmwC/bf3p9TwlR3IMYeUZe1yAosMaXibNQDTCxsXBlldXoxGySsX9FFRRWSN6
	OZLhgKvtJD6+ltUMFIgcYabjbe6ANqsMnO/Vp2cSnO1wzoJKe3aB44i9u+RuksBZ/hONEzGXXc1
	d3kO+QA/U5MQu+HfSFQQl2itI1/NEhSjs9muXdhjikIOrfKbszVZcgui3uFk3SNhKufuoSkpzca
	nkUMx74zyuivf80cT5b4vck0dkTMtdR7pxN6tJ9QBhqhpHCquJsG5uArQ1cKogJUX964D
X-Received: by 2002:a05:620a:2697:b0:7c3:ca29:c87e with SMTP id af79cd13be357-7cacea24688mr2331709385a.21.1746454491521;
        Mon, 05 May 2025 07:14:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH/vBvLz2xsMDmp49gK5gm96O/Tw7T3JFctVTVSeo6t9VZN8IC+KDCL2/JJC8O+HXJyk28oEw==
X-Received: by 2002:a05:620a:2697:b0:7c3:ca29:c87e with SMTP id af79cd13be357-7cacea24688mr2331704185a.21.1746454491141;
        Mon, 05 May 2025 07:14:51 -0700 (PDT)
Received: from ?IPV6:2001:14bb:671:42db:147e:6740:cd7c:7688? (2001-14bb-671-42db-147e-6740-cd7c-7688.rev.dnainternet.fi. [2001:14bb:671:42db:147e:6740:cd7c:7688])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ea94f6613sm1721233e87.217.2025.05.05.07.14.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 May 2025 07:14:50 -0700 (PDT)
Message-ID: <f56c19a0-18d7-438d-8d05-98ae7a842959@oss.qualcomm.com>
Date: Mon, 5 May 2025 17:14:48 +0300
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 15/24] drm/msm/dsi/phy: Define PHY_CMN_CTRL_0 bitfields
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Jonathan Marek <jonathan@marek.ca>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Dmitry Baryshkov <lumag@kernel.org>, Rob Clark <robdclark@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Rob Clark <robdclark@chromium.org>, linux-clk@vger.kernel.org,
        Srinivas Kandagatla <srini@kernel.org>
References: <20250430-b4-sm8750-display-v5-0-8cab30c3e4df@linaro.org>
 <20250430-b4-sm8750-display-v5-15-8cab30c3e4df@linaro.org>
 <j47udhqq3ldsza3cr6a6rd5dq7uxjgpolbmdhmpzvzt7glpuva@v5tgkydlywag>
 <97e49dc5-9cca-4c85-b0b0-18c472d0ec0d@linaro.org>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <97e49dc5-9cca-4c85-b0b0-18c472d0ec0d@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=EOUG00ZC c=1 sm=1 tr=0 ts=6818c7dc cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=F9VSnBJ7OdIsbtMwzSAA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: JhyINUuxYkzRhCR0LUaSrVYP_jBizezz
X-Proofpoint-GUID: JhyINUuxYkzRhCR0LUaSrVYP_jBizezz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA1MDEzNyBTYWx0ZWRfX5ZYOJph5ZOen
 uvv6TM5sm/mARj+QMne/V19o4GlXDJE/fgbdIo7lGCwUP6C6Cm6GsljJcQG6gVfvnlXq2S25T+q
 oB2XcMMBtqvtYCKSlOU1en1Ym4G4kxq1gD6uBARu47Mu5bujp/QR9SVUgLVFFrxb7d5czqdAv1v
 FFSdYfH3watuNG7gAyk/ytW7bF6wjpeSwlI3GUxuB5cE9JHC+FEDzdoAxMlruqzb6w+3DL/A8jY
 9FUjJy4eXNxH2ZV5NsbENXgvEQjigaqPXPTN6noC9gWwraU54J5i7DgM9PaDfH3Nj2L0M1o8UON
 CAwQZ+MYf/725QObIYkR+mwMrp/+G5mQS6SNAKozwyDbKkVlS1nn15WXCY/4jsaH8wOCijxw5+a
 2uUS9W8pve1quAVVDi8BzfcpDoNxjxJM6mimg/h9BOvzOC/yRrOMXuxFiazvZb6C+AimN3Ne
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-05_06,2025-05-05_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 impostorscore=0 spamscore=0 lowpriorityscore=0
 bulkscore=0 phishscore=0 suspectscore=0 mlxlogscore=984 mlxscore=0
 priorityscore=1501 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505050137

On 05/05/2025 09:17, Krzysztof Kozlowski wrote:
> On 03/05/2025 00:44, Dmitry Baryshkov wrote:
>> On Wed, Apr 30, 2025 at 03:00:45PM +0200, Krzysztof Kozlowski wrote:
>>> Add bitfields for PHY_CMN_CTRL_0 registers to avoid hard-coding bit
>>> masks and shifts and make the code a bit more readable.
>>>
>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>>
>>> ---
>>>
>>> Changes in v5:
>>> 1. New patch
>>> ---
>>>   drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c             |  9 ++++++---
>>>   drivers/gpu/drm/msm/registers/display/dsi_phy_7nm.xml | 11 ++++++++++-
>>>   2 files changed, 16 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
>>> index ca1a120f630a3650bf6d9f9d426cccea88c22e7f..7ef0aa7ff41b7d10d2630405c3d2f541957f19ea 100644
>>> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
>>> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
>>> @@ -362,17 +362,19 @@ static int dsi_pll_7nm_lock_status(struct dsi_pll_7nm *pll)
>>>   static void dsi_pll_disable_pll_bias(struct dsi_pll_7nm *pll)
>>>   {
>>>   	u32 data = readl(pll->phy->base + REG_DSI_7nm_PHY_CMN_CTRL_0);
>>
>> This (and several following functions) should be triggering a warning
>> regarding empty line after variable declaration block.
> 
> You mean --strict or what? It is common to have the &= immediately after
> assignment, so that's why I chosen that syntax. It is just more
> readable, but I understand your comment that you want --strict
> compliancen even if it hurts readability, so I'll change it.

I'd probably prefer to split variable declaration and readl invocation. 
Then the code will be logical with &= comining on the line adjacent to 
readl().

> 
> 
> 
> Best regards,
> Krzysztof


-- 
With best wishes
Dmitry
