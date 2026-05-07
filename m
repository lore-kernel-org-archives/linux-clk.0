Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDB0344CAC1
	for <linux-clk@vger.kernel.org>; Thu,  7 May 2026 15:51:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778169081; cv=none; b=J9czUTsKlDwTJ7S5WfMKcxqappGzjjr76z72I9QB6sbFoo9Qg9o1QElK6U5fp8FphN306vbxO8pLGowjqkcrecYynYKGawRbF3JcYoIqc8wy+pw2Ec7rx5YBkMYKwPO634IT90cZuDnrBK8VW78IcPMl0fh5WMQXjaI9y4WI1xU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778169081; c=relaxed/simple;
	bh=Nh1ttZ7apvcu4spD78Oi7RZ4MQs+MxjT4kjH8gqR2QI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=M/GPkJiQwRrCwfOXpgpe+CRvSmPMXX5dtvzcshI9L6NAS3uNE8t8gxJ0hq5t/IAn0Ueu3fQ1g4LdXhrJkzJ4MM15l3DOS4bSw6dRLv/0+4TtOJ/TKRZxAuzDYl4JWTQYTnopRV0NQTi+7xZsafhBO8krNdjzFmBAaHo2n3qDy+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PYQKnE31; arc=none smtp.client-ip=74.125.224.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PYQKnE31"
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-65318dafbcbso1054770d50.2
        for <linux-clk@vger.kernel.org>; Thu, 07 May 2026 08:51:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778169079; x=1778773879; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=C2yYmWd9mJdnEyzzwS7hgRL4uZz7swPezTy7TkKWYGI=;
        b=PYQKnE31qqBqzjTYBs96p+lagvLcynxBhOLappefc0i87O6MwwGDTQkho7EAYN85+m
         hSYGpBNXRh77sLIkd4cFOQYVkcwYTF9fXpsnmKKSFVU+90Pco7gixGUXsRopWwA/l3Zl
         u0pXJoSwHNUco3Pn75FcZhjWOczRxpfGOa+cLNXTCFgiedMg9DkRyiJ0/kAQ+i0Ibnpq
         /V8MhPxXc1nytoxmUVp+9ZFBGc28SYcExWW88SXN8E26R52rT+hkMpEomO1qQhY3fAob
         q5FcTwUdI0Fxrzg07oNa5rzj6SDiDwgCaugsgHWKS2Oe0u63vWkVMm4GCC0CnfhFATCh
         UWJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778169079; x=1778773879;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C2yYmWd9mJdnEyzzwS7hgRL4uZz7swPezTy7TkKWYGI=;
        b=I6rvQMffjFOfcvnU+tHvPmJBaWp5RseqTSMTIAtbtFSOdABKndtfUZOQx0UfBRoNFX
         dkPVclUwVNbKdMa4YuI7F0WaFvUUUoVZicu0Z9Hwg0heb1SztHkC3lDTfv53Ji1q05dX
         YLAoseDtAl9RfEBY8P/h2V1eqk0FN7ar0fK8EN2hkmix+M7j7VtLdKYyyzD+miYRWYHn
         MIv1w3tGgG3H7YslgaYdBpSwT+UqQJDEcY06bmg+hVHseO6xNiCDGmgfdeI9rwdfEc6G
         dhyMNDfyR7FsdS7Nd7liGw0b+cQDhSr4ZmZZLrqh+2KKty75DF4HpHrNv9/5yJ7UaEPf
         14ww==
X-Forwarded-Encrypted: i=1; AFNElJ+V+HJWCzDpduPiLyQYnEEugOF2ZZ15sza6HsWgYMyGVyV2ZOW5SWutCdXlx0lV0LLLlUIiuc1gp8E=@vger.kernel.org
X-Gm-Message-State: AOJu0YyF5ZfqkRfOG9lgKnPCCxQIlmA7w9Wf9CKHP6fDdv+3mn1FRy0G
	PL9Ha+SspLaqX/L7Rm/s5MMyvubHH9LiSEdbAchpczx+8Y+MqYK/pfqi
X-Gm-Gg: Acq92OEksytGlqHfwtMc8G3/fCqyK4tFcB8st/I5tsOY29TI4bHJLYCGvM+k0wk2rkT
	3OkqcvfRwh4F7x4XEoNaFgq7aM6y+JOd1jhKkxlOl3agrXfqqzML6eZsfD7h6A6s4XGzUgaXq4q
	kLo9aVogyMXz1ChVx0sR7jX7ogeURnAC2fgjG5dHsf+CEEgR1I5wYYYkY8Kh2D6Ur9keXQVgFxv
	gxhjzU8A40j9si7A/KdWbOW9T3dG4cMZsJPow5Uq9wbfzUjLSTWnSWQa38GL2C5U/SuLMon8Z+N
	ZhS5LHFxfF6K2vUzib2VOYZG2xpnw4tR0c0H9TkFG6mQWvYYmQQeSVJ1EmJAc033aM8Kq9wXqnc
	pTAzRldvO9dbhrUHbdzjWnbGJcNiOxYTNQ/OHt7HK5uDBa42JgPzivZQZsqfjpSIuT2mTvjgjOp
	CBRgfj+LkNWhbga9eCqKhIJLVdOvjG8eoMZh2q
X-Received: by 2002:a05:690e:144b:b0:65c:febd:c0b7 with SMTP id 956f58d0204a3-65cfebdc8b0mr5697087d50.20.1778169078832;
        Thu, 07 May 2026 08:51:18 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-65d901b9275sm73091d50.11.2026.05.07.08.51.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2026 08:51:18 -0700 (PDT)
Message-ID: <0cee27b6-f566-4958-8634-2c43e099281e@gmail.com>
Date: Thu, 7 May 2026 18:51:11 +0300
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 5/8] clk: qcom: gcc-msm8939: mark Venus core GDSCs as
 hardware controlled
To: Bryan O'Donoghue <bod@kernel.org>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, =?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org
References: <20260507-msm8939-venus-rfc-v5-0-d7b5ea2ce591@gmail.com>
 <f5TsKnC12rLsH63vAi01aN4oXUFLrfgIhn14IQFDb9gcac6anLzzhJdkGNdQ2dRs4vYbFKUptfEgWuKdgIgGsQ==@protonmail.internalid>
 <20260507-msm8939-venus-rfc-v5-5-d7b5ea2ce591@gmail.com>
 <17c4626e-8926-4cad-842d-a1b171d1e962@kernel.org>
 <CYaHtccGOWlaUtl3QIKva44ybJiRHsPOZmHEkl2KKGmnDxJ8vTH-SVNMGbL7bjkYjI692nplORzOhpfjs3XJfg==@protonmail.internalid>
 <4f1ab5b8-3bfe-43a6-8b91-317456188544@gmail.com>
 <7df3bff7-b872-4b20-8e7c-698157a41f33@kernel.org>
 <tawGGT4rtpw22Ng-MgM--GhoEihBU7tY_TrFUHf8raMKApyqTcSkKHyfSuRIL_bqNp_5zWD4SBG_C4c8CB7_6Q==@protonmail.internalid>
 <18998766-62fe-4a5e-95d8-1bfae712d8fb@gmail.com>
 <614a087d-d219-49cb-85ee-772044558649@kernel.org>
Content-Language: en-US
From: Erikas Bitovtas <xerikasxx@gmail.com>
In-Reply-To: <614a087d-d219-49cb-85ee-772044558649@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 5/7/26 4:37 PM, Bryan O'Donoghue wrote:
> v4l2-ctl --verbose --set-fmt-video-
> out=width=1280,height=720,pixelformat=NV12 --set-selection-output
> target=crop,top=0,left=0,width=1280,height=720 --set-fmt-
> video=pixelformat=H264 --stream-mmap --stream-out-mmap --stream-
> from=cyclists_1280x720_92frames.yuv --stream-to=/tmp/
> cyclists_1280x720_92frames.h264 -d /dev/video1

With the patch kept:
v4l2-ctl --verbose
--set-fmt-video-out=width=1280,height=720,pixelformat=NV12
--set-selection-output target=crop,top=0,left=0,width=1280,height=720
--set-fmt-video=pixelformat=H26
4 --stream-mmap --stream-out-mmap
--stream-from=cyclists_1280x720_92frames.yuv
--stream-to=/tmp/cyclists_1280x720_92frames.h264 -d /dev/video1
VIDIOC_QUERYCAP: ok
VIDIOC_G_FMT: ok
VIDIOC_S_FMT: ok
Format Video Capture Multiplanar:
	Width/Height      : 1280/736
	Pixel Format      : 'H264' (H.264)
	Field             : None
	Number of planes  : 1
	Flags             :
	Colorspace        : Default
	Transfer Function : Default
	YCbCr/HSV Encoding: Default
	Quantization      : Default
	Plane 0           :
	   Bytes per Line : 0
	   Size Image     : 708608
VIDIOC_G_FMT: ok
VIDIOC_S_FMT: ok
Format Video Output Multiplanar:
	Width/Height      : 1280/736
	Pixel Format      : 'NV12' (Y/UV 4:2:0)
	Field             : None
	Number of planes  : 1
	Flags             :
	Colorspace        : Default
	Transfer Function : Default
	YCbCr/HSV Encoding: Default
	Quantization      : Default
	Plane 0           :
	   Bytes per Line : 1280
	   Size Image     : 1425408
VIDIOC_G_SELECTION: ok
VIDIOC_S_SELECTION: ok
		VIDIOC_G_FMT returned 0 (No error information)
		VIDIOC_G_FMT returned 0 (No error information)
		VIDIOC_G_FMT returned 0 (No error information)
		VIDIOC_REQBUFS returned -1 (Invalid argument)

With the patch reverted:
v4l2-ctl --verbose
--set-fmt-video-out=width=1280,height=720,pixelformat=NV12
--set-selection-output target=crop,top=0,left=0,width=1280,height=720
--set-fmt-video=pixelformat=H26
4 --stream-mmap --stream-out-mmap
--stream-from=cyclists_1280x720_92frames.yuv
--stream-to=/tmp/cyclists_1280x720_92frames.h264 -d /dev/video1
VIDIOC_QUERYCAP: ok
VIDIOC_G_FMT: ok
The pixelformat 'H264' is invalid
VIDIOC_G_FMT: ok
The pixelformat 'NV12' is invalid

Decoding breaks if I revert the patch as well, it fails with a power
collapse fail.
