Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5E5A14A639
	for <linux-clk@vger.kernel.org>; Mon, 19 May 2025 15:08:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747667300; cv=none; b=CzJMCMa0BnQEQF+Es0GGU/g6I/EtFzxx0UWJglp/6YFowXv85HzleSO3YQkdb6t3iYlkpFKGU34tYhNFPm24G0QUp7uFi0NvMn9Am1gREz7H9pfJt/HGX4w6/UHsRuJfRRmhNyW6TgSlpVTJN74YSjXAAX0Di2VDEzo8+1xTg0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747667300; c=relaxed/simple;
	bh=ILrvKtqjno8XWN3kqUgdsY+HZftdvQtnAfXlAoTjKFM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S9zDv2h6iIb3uX3IJ1I0w9RXzhF2wbklFLk2vI10jxrNB3jvu7qbHO1rrzgVsWYyLjmFfjj/5YuIyeFklpNrECxXYDXfrvvSw8tycTitF64XYh13wzLuYjfNLrIgXWg1gZvnNLNzZPL6kyL+5DBb6r1V2ihWFigmJ/FNUL42Ru8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n4J51pG8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n4J51pG8"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54J9ipXI022760
	for <linux-clk@vger.kernel.org>; Mon, 19 May 2025 15:08:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=pnbK04rSw5LfgSejzbkh3QJ3
	tYtMCLEGOFKCm7S1tuY=; b=n4J51pG8BVZa1SayKI0SpSjmp257mTlLVz2mPke/
	GP4Ws9bG81sl4rgTq/gVV2Qabr1qPr27513kQ4Qr9364x0oL4oSEBbHeJXg3XCds
	8fOo03NrIYOPGR95kIvQzlE/buW2JkN4Y5c7UgiIdGAUXPRs+BvKJyyLbTtPhn+b
	uJOuOg1fBh6vihIbR1syPZDRUJ81nMZzHWucLdijEGSwNfGO6bQCEzXPcmptBYLj
	KvtjpHs4ft9EMQpYmevTyn/E3DC6gIuZgeFCVweO0/bMSvJssF6chY8LOklWV9Xo
	Mct3swrsEpuvpY25JZHecb13xCTn+x+cVimMyLMFVtrkXw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46r29d0vr6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 19 May 2025 15:08:16 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-476870bad3bso66577721cf.3
        for <linux-clk@vger.kernel.org>; Mon, 19 May 2025 08:08:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747667293; x=1748272093;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pnbK04rSw5LfgSejzbkh3QJ3tYtMCLEGOFKCm7S1tuY=;
        b=viEyVnYEnwX8gZGHR6KnDK8SK+0EBdBK/U8po6+nvrOdtriBD3oKaOXo3fLONHfsgv
         ZIWWyvjZZluexWQATiLIc9vz5iFI/ZuA9+/hKoISZ7JElMPTyA3QbYJveu1WpTybO2gR
         0KM6fuo1BBYxvQRYpUTUJZ3VPCWqLWViGMxaJ84vlKIG0+EOPIQ66VRPKXqIbxK4cjd9
         5F3KM30SvRyuOnARuxHJPr1Ohf2W/LdGt32kec50a8I6onQyAfztA7SFgGh+rSOmKOHB
         aletK53WIz/nWGQYbPMfGC0A7dutj7DKDGlOoMF1YM3lxBYpQ/gws2QdC1fnWX13B+S2
         EJbQ==
X-Forwarded-Encrypted: i=1; AJvYcCUC40CPF4BBCbVudE1XTO4hueq2Ymz9GFxkX8N4CsSgprAjlhHEeAFXpWrWfzjrIXusFUNnXQeqbSQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzowVRuusQCLxZFoyKOR8LaeH27aZOWYPEXysRpmxN2q/pmq4XT
	IRe55jf/Mn2YY830BHTsBKr2bXdAiaByHkwmomqnONSKcVlwa9vhogioXr2nGrrciCnEaNrhpok
	3qfL2TlNsnH7at7UqcVANPZDTngm1SLwdEdkv/DuLFuCeduElcyv3R6jxjo2wL2qy7Z1S5wY=
X-Gm-Gg: ASbGncsHtnzECo9gNz99UpG8VT87GYYNDn35DdZv5GKdk8LMDh5fN7p+CgKMWNJQEtJ
	XKSETcqozJm/eN9X4dW6qWyvvW1DUd9jJiI4KiziFoYeZ7GmK3ew5gE1X7gI4CUVDae0Oq6JvTg
	SuPExaaBp3F9VmhCKPYH3A9St3Jjbd+RexGx2Y+sUtSKfYGNOiQAiRfWlKztEQNsrUXAnWrP+aX
	/vFDW5EXIH7Cy4HOO94pl9QM/mXiTqht28emrHhuMjOesVhQrSZ8uI1jVr/KCXD+E17jAgMDad7
	X4hq8hP1YB207URcGlG/o/rayvaZeGfNpF1L++Qn0RpeSxGwjSi8K7COvd/dg+C4qmxNd7GUGWI
	=
X-Received: by 2002:a05:622a:259b:b0:479:2509:528a with SMTP id d75a77b69052e-494ae451050mr231101651cf.42.1747667293405;
        Mon, 19 May 2025 08:08:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFS7ZI9iTUTS3skWTcOcofhzUOZ7bKXIr+bJqh1BroaJVamHikSdw6gyrDyo62FkE6ExDiHnw==
X-Received: by 2002:a05:6830:488e:b0:72a:48d4:290b with SMTP id 46e09a7af769-734f6b88831mr9233068a34.26.1747667282670;
        Mon, 19 May 2025 08:08:02 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-328085f097bsm19317971fa.110.2025.05.19.08.08.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 08:08:00 -0700 (PDT)
Date: Mon, 19 May 2025 18:07:59 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Jessica Zhang <quic_jesszhan@quicinc.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
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
        Rob Clark <robdclark@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Rob Clark <robdclark@chromium.org>, linux-clk@vger.kernel.org,
        Srinivas Kandagatla <srini@kernel.org>
Subject: Re: [PATCH v5 00/24] drm/msm: Add support for SM8750
Message-ID: <pbg537yuu3sy2ueho5gcfu6cuvgmkobzgvtfemghvp5w6errtv@f4gbobbeqosk>
References: <20250430-b4-sm8750-display-v5-0-8cab30c3e4df@linaro.org>
 <75f503ea-e8cf-48f3-b39e-388ac456821f@quicinc.com>
 <24e49307-7d75-4736-9b5c-2e6286fe57a3@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <24e49307-7d75-4736-9b5c-2e6286fe57a3@linaro.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDE0MCBTYWx0ZWRfXwtsYbZgQHD+W
 FgR3Ko9n/vPvToUsCLYP5ZI12u8OAjkXg49M+fX42x9Q4NLSZEYxThO/zZ7eNQg1tLAewHITqn6
 ALnbepKBze+tlvvCHM9A+Nu1PfT5mJmSb7FJfvjaY+vsYNMtYhRaNpkr8fDqqMnUvZaVtXahNS+
 658LRtLXe8xecqzebiH/deVCYmkeLBDVH8a2VrLdRsSgkOkjEGi+DTcISdEi0tDicLdZu4SZ8Y7
 2tuqu1EJxEdw8w6Yt089SxHCDbQ8HwIPwBE2TNITPyin96gORRauJfSLwiu34ri4IL0xfpCtYYq
 Kqk2qQ8YfBdjLbxTwrVLqMbyYaiHV7lanKt9mCG6vevdSzRQJOmClWL0NIyDhiAbiESAn5f4o8r
 OsdDcqw/6Dn3cDKqrK5cWsEP6231S7L5RAFH3AMFZfuIXzGWQLWvUrtjP8Bc+Tu34zod5k0G
X-Proofpoint-GUID: Uwbvki67RvQYrVMmitVqEf-CxjrDDSHf
X-Authority-Analysis: v=2.4 cv=KLdaDEFo c=1 sm=1 tr=0 ts=682b4960 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=mreiCzLEixqGZhZwl8gA:9
 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: Uwbvki67RvQYrVMmitVqEf-CxjrDDSHf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_06,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 clxscore=1015 malwarescore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 mlxlogscore=999 mlxscore=0
 suspectscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505190140

On Mon, May 19, 2025 at 04:52:15PM +0200, Krzysztof Kozlowski wrote:
> On 17/05/2025 02:08, Jessica Zhang wrote:
> > 
> > 
> > On 4/30/2025 6:00 AM, Krzysztof Kozlowski wrote:
> >> Hi,
> >>
> >> Dependency / Rabased on top of
> >> ==============================
> >> https://lore.kernel.org/all/20241214-dpu-drop-features-v1-0-988f0662cb7e@linaro.org/
> > 
> > Hey Krzysztof,
> > 
> > JFYI, I think there was some discussion on IRC (specifically #linux-msm) 
> > about having the feature bit dependency back in February.
> > 
> > I believe both Abhinav and Dmitry agreed that you can keep the changes 
> > to do version checks and drop this dependency.
> > 
> > There are still some ongoing discussions regarding the feature bit 
> > series, so this way your series isn't blocked by that.
> 
> I was asked by Dmitry to rebase this on his rework. That was quite an
> effort. Now I hear the dependency - Dmitry's rework - won't come in and
> I need to rebase back, which will be more effort. Can you all ack this
> so I won't be needing third rebase?

Please wait with the rebase. I still plan to get it in, it is an ongoing
topic. Anyway, I think there are several open issues even with the
current version.

-- 
With best wishes
Dmitry
