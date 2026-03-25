Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8551F4F1
	for <linux-clk@vger.kernel.org>; Wed, 25 Mar 2026 20:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774469304; cv=none; b=WzW2c23ggZZUBDJFTFt8E7JDMsgLGbEXqzxBlSyRn8wVIxveS0VjMeH5Swg0LXol9pGLWBOZuWZqfN8oIAzM2/IQIAqFZlvmodRQ8Vurpf1u1XLMCo5lLYVrzWfDsi1wbXkox3UhXRNFWljp7fAAoE+IMVcOAkpW5q33FW0vYQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774469304; c=relaxed/simple;
	bh=lD2t1AMxlzRcnXK8iTU1zKwGBKi3PFz6qWPKGrIlIDo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K0LVqaol8XaF545eQ2WzYTFpqHfqHPtEFQ5FsyG+pS0Uc+IONXeR+BHsqnc1ZpnfMlBSqfkkd1Jdxsg0u/6BZqrY0SN8Dnn7SphY19/lRc93Y1V6LoE263t4eBZPkHYAoYKcdHROPQeHvCg+q+r3498XfYEZIFzajzWYyDFCZQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QKSJO4vx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XhjRPYSy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QKSJO4vx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XhjRPYSy"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62PFHHBW779740
	for <linux-clk@vger.kernel.org>; Wed, 25 Mar 2026 20:08:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=d/+7PKEkluk0xu811L4V4ceE
	Km1CSLIwU5nrjfkgJ4U=; b=QKSJO4vx7rXJhpV2pKIpBT8E1U1AfJ1BdUCegOnR
	kOkQbT4y9o2wrx4FQodSthzyrWATXm79MDb7loobcCIVGnsnTVQu96+8mSUX6C0Q
	iS2r0qMVyUMejqNqpDXpfpWKfgm1sHk90MCs/aUQDw76bsPkG/SIcYAkrHwgcVrO
	kmQcjyRD0rIpcHr59OVFqheVtyiA6PiG8giPbV2bIVGMvD8ebMcQFGXBieUAKJhj
	hnDTDBE+xUX6UOcgn3tVeVPYcfgoHMGtXfNER+RiSY7O6aYWbnr4RryqDGtxZRUZ
	Z6ozCgdxPQ5MD/edpSFOxt5yINstAXrTn34oRbBvntYEvA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4cvp2chg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 25 Mar 2026 20:08:22 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5094741c1c1so6180301cf.1
        for <linux-clk@vger.kernel.org>; Wed, 25 Mar 2026 13:08:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774469302; x=1775074102; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=d/+7PKEkluk0xu811L4V4ceEKm1CSLIwU5nrjfkgJ4U=;
        b=XhjRPYSynxRZYwbCWm77DykOxkbu/u2faJJM7VfyuswVI2m6zD6gsFxpxcbM0dkBsR
         u6HvMOgV+fm+0QnXom1VzZjrbSU8lF4DoncgMTenvPacpHZqAj+zsJKd9g61FPAgtCk3
         mvR8+6DhqhYI4DgVlvzz3dSi2gWgZamQ1h8m+shjWFfTWzAwuhi0DdDpZtd+4SHHdM7a
         bUVK5qVG4L9xqdKTQHdWW6mHBVGp/+IvOwdSbhkle7DAQqwF+zPUrCp5LBpEUxvq5Mfm
         6tM4Mk3g/L4Du9wMA7300NvzDsMVHHb0d2cF0dATXaf7EArNfVlqmF0wdQtcfq+Sma+A
         6Ewg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774469302; x=1775074102;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d/+7PKEkluk0xu811L4V4ceEKm1CSLIwU5nrjfkgJ4U=;
        b=cuec4s2ZqCZHdn4qsEUNFrtlVsHy9tdy6drCZfp80hPk4Jbd533rNp/2zQL1OvuRA+
         MmFtaa/bLK1fbIZVwVt3mmUxjXgog3hRhHQJvvzw2hfujK0yL3GJJxUDfB0zprK3KN1s
         ocXCvoCgGVM+AAxLURZgr1R5r/NYiLxLxF5EA/HAUJoifsNpL5yRSWPj/ColCOispNWM
         ekYXilexKiChpxHJvFkr3D/hQNP2DT/Xvqt+BkMzQ0L729G4QA+FVL8+jwiJaH5lmrn/
         PJeHx35xqz0HOb5mWs9d/rEjPsSWTWePvMTVU1gw4P86VGkFnDF3GeBnfUmbgt6YIT3O
         DdRQ==
X-Forwarded-Encrypted: i=1; AJvYcCWPsL+NU2R9ccfII9JKm77yLJVbHEot8/JMCPnEOIbzQV7k9yKABbN51pxJXJVMssK1Vr5znc0JCL8=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywk6lYSpYeiPPzA43oz3f61WocH9/7/vJaRq1j62d5Fp9B6hWa8
	3ELyDja8GuBu+HncITsz65h2Yqk2x94+NmgGwOWsXtCmL/dfuZrWeTCUcq31UBxUnOXi0hF13Yo
	kMgZT8EqA9YckgSO5v9ZzflyiVszkMK4fjP6u2YxQJ2DjZRoemW/80SI6sPTgqBo=
X-Gm-Gg: ATEYQzw4iGARRQLkhc8tIVjEPdYkAx6+ObhyerBw5HbBDxT5wKcLehqiDnoY23jn1ja
	jJkEPChkmelVVhrB94T/U44osMtZZHXqLhGWXyU7zEeS5vdqbmRmps+jHGLQQ+UEklgDFoGAj5G
	8PQTemyrtlg8ozKV2bFZtoRdGg0jb8g0aPmJej1MOAh/lJTq1+64H/s38lA6WIovR5/b/KtXO0k
	67XzHDF09Hd3VR98LZk107oX5iGG9Xhh4StXOqzFBhLDLt+BYfgOgxe5BPj7imWdRfwc5K3/fLs
	k4MsViJqn2DKhJx0Fs4neQ0NuiJc7zeBSlmL3dm102dnyafMkIUC1KET0+uWJV0KJWkUaedkkg+
	NJUfCN420uQiweJyuwkcsbcZRkYC43iJdwGNRxq8fOXeLj0t4ugG7XkUiG5cy8ERuc4Pjwy/LiH
	l2+ChiCA0ZqFcym1+pmXle6Bm0uJ4fGmLMjbA=
X-Received: by 2002:ac8:5a8f:0:b0:508:faa5:451a with SMTP id d75a77b69052e-50b80cd3400mr69468841cf.13.1774469302069;
        Wed, 25 Mar 2026 13:08:22 -0700 (PDT)
X-Received: by 2002:ac8:5a8f:0:b0:508:faa5:451a with SMTP id d75a77b69052e-50b80cd3400mr69468391cf.13.1774469301627;
        Wed, 25 Mar 2026 13:08:21 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38c5332d99dsm1145711fa.39.2026.03.25.13.08.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 13:08:19 -0700 (PDT)
Date: Wed, 25 Mar 2026 22:08:17 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Biswapriyo Nath <nathbappai@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Pavel Machek <pavel@kernel.org>, Sean Young <sean@mess.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Martin Botka <martin.botka@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org
Subject: Re: [PATCH 2/7] arm64: dts: qcom: sm6125: Enable USB-C port handling
Message-ID: <kirmecnwddfikawqulzwgkdple3jq7euvl45meevjmak654mse@e4wiaodqodah>
References: <20260325-ginkgo-add-usb-ir-vib-v1-0-446c6e865ad6@gmail.com>
 <20260325-ginkgo-add-usb-ir-vib-v1-2-446c6e865ad6@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260325-ginkgo-add-usb-ir-vib-v1-2-446c6e865ad6@gmail.com>
X-Proofpoint-ORIG-GUID: deSF0KMDq1XYc6bzkOvZ3N5r97yiqxhL
X-Proofpoint-GUID: deSF0KMDq1XYc6bzkOvZ3N5r97yiqxhL
X-Authority-Analysis: v=2.4 cv=Q73fIo2a c=1 sm=1 tr=0 ts=69c440b6 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=pGLkceISAAAA:8
 a=H_3iQ2LuRKvP6GoHn7UA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDE0OCBTYWx0ZWRfXzKYrouZSz0ds
 6bWm3QVjQ2JlHlj70++mUtL1sSZ+e/s8YZKWsadwsOMTvGKJ+Fb2Jqx2akfoktonDEVZgiNIQzX
 N04B8B5gyvMknAp1tS9FjKW1zLvADfKJymY+0c0q/iGOA9VNAIz4h5oEAdvx8RdQOpdjvHKk/II
 rNz/wKWSgtjLRjBmpJN3egWnbtaZ5TsN2o0h07OW31QXCjkVxqvne6JgoXKVJRYyBc3LylRDVQ5
 zSWsk7Opxl3nvGpEcQeGZbYZiA+b46O2J3CEmhnYnfARU/SndmbDbBojkGXmKmPfvrt2NrtJP2O
 AUKG7t57bvwa9NC7XhJKK0rcPmemJpLILL83wyt4az/HVuE4deciK+Ik2pHhvDawneUBepKJ0/W
 +rnyXFCT3yIRXhvZodUew2BbfB9HO3jHgRx8Cfv0nULPIVXa2/EtCfo3Ab0gCwmygkvq8qBEAnD
 VwhsixvNNCl7dUsRldg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_05,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 malwarescore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603250148

On Wed, Mar 25, 2026 at 06:07:25PM +0000, Biswapriyo Nath wrote:
> Plug in USB-C related bits and pieces to enable USB role switching.
> Also, remove dr_mode to enable OTG capability.
> 
> Signed-off-by: Biswapriyo Nath <nathbappai@gmail.com>
> ---
>  arch/arm64/boot/dts/qcom/sm6125.dtsi | 15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)
> 

-- 
With best wishes
Dmitry
