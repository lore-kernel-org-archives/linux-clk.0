Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1E8C2E7635
	for <linux-clk@vger.kernel.org>; Sat,  9 May 2026 12:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778328041; cv=none; b=MTK5B5TmVCrO1kz4L601BJY34ToMvsLEOgjbsupfgdVNhzsd5AZ/fKjez8b3tVP/UlMSesGntkSyjyzZd9bZ+xlJOtPuKoydjqVCeyPpqDRYd0dAV8eYu2lyRFA7MHm2AAN9xi+yRWN0A7Lzep1yB11W3Qp44MNoreh+nVmOsmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778328041; c=relaxed/simple;
	bh=iemCui2l8qqvzux3lam3RV5hSucVjjAACXX7LzCZHcA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=K7lbEElEqM/2zOL7c+RjE5AEqxV0y5UBDdrkJCpSWU8Ged5L6FH9stnIlIZ5thBKfqAWp53dHNgoX1gXR+kSOs9bpqef055K5I0hzpZV+vA/gqRQ/o1lJ+xklfFvZtuTTPx5qUzSNIs+GwTlRpDW0ISG74uVRueEdm7dMfjUpFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A7TN+NgJ; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A7TN+NgJ"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-bcc2b199c17so44669866b.3
        for <linux-clk@vger.kernel.org>; Sat, 09 May 2026 05:00:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778328038; x=1778932838; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zmUf6SNpF4clO18ErlUoo6BNS+Vk6nKV8PcksNLHfkQ=;
        b=A7TN+NgJDOiROdSbAmP7uh/zrwBSV+nGEFjf6F2Gp9Wbx1FCzxQxNvTT9cfw7JLzmd
         gq+isEPxiAl7kKjsjKvZEYOxPBv/446cLEKUun52UKzI4zCbw/0tw8UmDSWANXcgP4y3
         Cf8UcV3gdKmhKzUp9TTd4ZbngpmyZo8eDl7s3tQ+xGlbyf6qxMCBsSxkGH23W3oIHAcX
         nP/fcModN7+s0dVCP4b9YtD4khIqFG5uoZDQa9ofKOTpmFHNyJ/ijVodp1PeU9K+6y9e
         C4ZQECaBbPzW/XubM7Ijk4gG0JG5cfyg85ToHzxwqdi4i3UM01T4gaStKNbEzQYNc5Uw
         yGlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778328038; x=1778932838;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zmUf6SNpF4clO18ErlUoo6BNS+Vk6nKV8PcksNLHfkQ=;
        b=Wd3Mi+L1rAW8cksSDt6Cs18DYZpiyMh2ojbAJYk9JVMzj8CdbdUY4xtU1gXSlO2qi9
         FoRbyZpeiDZLJMJfSSGpU4hfUWqLmgjReCK9e1SAbKfMeRxK1RnucjDle7EpbUiqwV2j
         a/14RJk1cUU34Q+KNO387uI+IYaW9Ol6uRfEEhTIDSeFTuJdcg9KESiNI78zrcMNr10V
         Rq3BnViuGr8W0J1ri1dwqYna3PXiNxrWQkqaMuP68gigHtw2B4jHfQjMef/SWPCkGgpZ
         yr7LIHp1vC7AFs3dj8W+YxfMsoyfebORHqOoLPCQUf7DSY9+oPlrayZ0lki9lDqeQ42s
         El1Q==
X-Forwarded-Encrypted: i=1; AFNElJ85N773D2X3PLwPth5GdfdLeYZzwgcadmyVGGb4P29IecS4PbdNzfBPuz0tYDePpnWsqUga/YFq0oA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwBYTUIVj8Rav81PBY8lUwA9CDbMyjsVioi4+jfzVK6aFVBKazE
	5WPVE9QXxJKFagdRd/LwdVNKiezx5g05dKExTuhBMw0HGcia3ULWfqxE
X-Gm-Gg: Acq92OG8O+Q6d5lrHtIg1oUNIsfm28DDbrjR5pGXGrpCAyj0yDcUTJUJvYVLxpSXQNy
	9q2HAzLD0+Jsn8fKqtfXA7FW/9Wng9d2wkqjDPiYK9Kt1Cc3/fa/5ZFFJBMbW5/iomRMSO9WsPp
	yqe+vYDwt0ijq0/iYUa5X+q4t66NrSF+2Owm8krpkphepfXKswBui5T0ULAoItwVaZTmowwiq18
	cVrvDtO+dSw8zeZxB/+ny/78VnH4vHl+39Ddo8mfwCDP/fURYkC0hMhDQo/2WhBG2yMeCmW6cCL
	p3TiIDpmUi2bpgX71I8OTdALsUleeyN7aFbkg6O4UmxJQSko8Nxsu6gBxgw8qPadCphwS9rcCgF
	QO2yGIwvXtBNUcKid/sKjk4R3MYoIsdmXGdMnMu9aYQPiYT6JIF1LpbOnltPeAjQodDxo64hsY5
	QOMgzfPE4gTOpnEMC0pw4MDIbf+h4fTdgy57vnw1vDVBa4e13QgzqbWJ9sm2AowabHsiHl
X-Received: by 2002:a17:907:c817:b0:bae:456f:fbb2 with SMTP id a640c23a62f3a-bc56cd3b1ccmr1054228966b.23.1778328037744;
        Sat, 09 May 2026 05:00:37 -0700 (PDT)
Received: from ?IPV6:2a00:f502:160:4e2:a099:cad9:2ecd:93de? ([2a00:f502:160:4e2:a099:cad9:2ecd:93de])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bcac4359ea4sm219872166b.50.2026.05.09.05.00.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 09 May 2026 05:00:37 -0700 (PDT)
Message-ID: <69f9a6b7-7431-442a-82a2-6305635a508a@gmail.com>
Date: Sat, 9 May 2026 15:00:34 +0300
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
 <Jxt4BbN1dL8VKh_Zjah1xecAjz3c9VfbhKSm4a0K2D1MNKfJKIFnCPLj2VvdW1q4LnMIQy8bCzV3YoVnLFYUlA==@protonmail.internalid>
 <0cee27b6-f566-4958-8634-2c43e099281e@gmail.com>
 <dd435489-0cf7-4274-99bf-a591a15e91e4@kernel.org>
Content-Language: en-US
From: Erikas Bitovtas <xerikasxx@gmail.com>
In-Reply-To: <dd435489-0cf7-4274-99bf-a591a15e91e4@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 5/8/26 6:55 PM, Bryan O'Donoghue wrote:
> On 07/05/2026 16:51, Erikas Bitovtas wrote:
>>
>>
>> On 5/7/26 4:37 PM, Bryan O'Donoghue wrote:
>>> v4l2-ctl --verbose --set-fmt-video-
>>> out=width=1280,height=720,pixelformat=NV12 --set-selection-output
>>> target=crop,top=0,left=0,width=1280,height=720 --set-fmt-
>>> video=pixelformat=H264 --stream-mmap --stream-out-mmap --stream-
>>> from=cyclists_1280x720_92frames.yuv --stream-to=/tmp/
>>> cyclists_1280x720_92frames.h264 -d /dev/video1
>>
>> With the patch kept:
>> v4l2-ctl --verbose
>> --set-fmt-video-out=width=1280,height=720,pixelformat=NV12
>> --set-selection-output target=crop,top=0,left=0,width=1280,height=720
>> --set-fmt-video=pixelformat=H26
>> 4 --stream-mmap --stream-out-mmap
>> --stream-from=cyclists_1280x720_92frames.yuv
>> --stream-to=/tmp/cyclists_1280x720_92frames.h264 -d /dev/video1
>> VIDIOC_QUERYCAP: ok
>> VIDIOC_G_FMT: ok
>> VIDIOC_S_FMT: ok
>> Format Video Capture Multiplanar:
>>     Width/Height      : 1280/736
>>     Pixel Format      : 'H264' (H.264)
>>     Field             : None
>>     Number of planes  : 1
>>     Flags             :
>>     Colorspace        : Default
>>     Transfer Function : Default
>>     YCbCr/HSV Encoding: Default
>>     Quantization      : Default
>>     Plane 0           :
>>        Bytes per Line : 0
>>        Size Image     : 708608
>> VIDIOC_G_FMT: ok
>> VIDIOC_S_FMT: ok
>> Format Video Output Multiplanar:
>>     Width/Height      : 1280/736
>>     Pixel Format      : 'NV12' (Y/UV 4:2:0)
>>     Field             : None
>>     Number of planes  : 1
>>     Flags             :
>>     Colorspace        : Default
>>     Transfer Function : Default
>>     YCbCr/HSV Encoding: Default
>>     Quantization      : Default
>>     Plane 0           :
>>        Bytes per Line : 1280
>>        Size Image     : 1425408
>> VIDIOC_G_SELECTION: ok
>> VIDIOC_S_SELECTION: ok
>>         VIDIOC_G_FMT returned 0 (No error information)
>>         VIDIOC_G_FMT returned 0 (No error information)
>>         VIDIOC_G_FMT returned 0 (No error information)
>>         VIDIOC_REQBUFS returned -1 (Invalid argument)
>>
>> With the patch reverted:
>> v4l2-ctl --verbose
>> --set-fmt-video-out=width=1280,height=720,pixelformat=NV12
>> --set-selection-output target=crop,top=0,left=0,width=1280,height=720
>> --set-fmt-video=pixelformat=H26
>> 4 --stream-mmap --stream-out-mmap
>> --stream-from=cyclists_1280x720_92frames.yuv
>> --stream-to=/tmp/cyclists_1280x720_92frames.h264 -d /dev/video1
>> VIDIOC_QUERYCAP: ok
>> VIDIOC_G_FMT: ok
>> The pixelformat 'H264' is invalid
>> VIDIOC_G_FMT: ok
>> The pixelformat 'NV12' is invalid
>>
>> Decoding breaks if I revert the patch as well, it fails with a power
>> collapse fail.
> 
> If you declare both as decoders can you successfully decode @ video0 and
> video1 ?
> Apparently device nodes for encoder and decoder are not persistent
across reboots, so when I reverted the patch, I was actually testing
against decoder, not encoder.

So, the result is the same when the patch is applied, when it is
reverted, and when testing against v1 where the cores are enabled only
for decoding.
