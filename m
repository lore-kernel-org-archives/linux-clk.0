Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C97C1E9906
	for <linux-clk@vger.kernel.org>; Tue,  9 Dec 2025 10:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765275417; cv=none; b=Gb4QMcluwPG5moM3t4vbxhIAT3qMDZPmu2pKq+0FrMU5r1BwHIApKqQpxjj+3iAA1/XdwvXpu1nZDqNHxQ11tmgrVFRyXAl38wyn8nq+j8t+Zuht0jnO1HavpoXas8TW9q7g40/GHs/kBmQn8rZ6FAe8D/jiRASeu3m5GLx55Wg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765275417; c=relaxed/simple;
	bh=lnP0ofzE8d7DV/VQbUQ/F9NhcdvvDdebrS3l/N8sJM4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=aFigvQsgRpLvqLg+XXW/b/8mFzrhKp9kBT7L6PNxFfcNDWOdIL7qIQw4ypJick3c7d5bBe6uOUogyAVHRJMwamfDP8z/rkOZa5cFByoKIjQlJ4DIAw4fJx/spUvWodZWS4xcZu+YzOOVt9mvod0ZXHOlmX+81p0kCGus3SUb8/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=mMbaVT80; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="mMbaVT80"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-42f9ece6387so219620f8f.0
        for <linux-clk@vger.kernel.org>; Tue, 09 Dec 2025 02:16:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1765275413; x=1765880213; darn=vger.kernel.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7jqYN1k2sIIVDynNkGogy0+4dYc363N58InYK+olTwA=;
        b=mMbaVT80BNtcSYVt3NJVjNQbVygQR3cHB8Ey9CCDbZ5/9ThkW7puUCWZBXOTLVhQEZ
         vGxI8TuJ8upwftqvzwxi9gOup+A0LutK18PpkcAUtz4kWPqRIOsElyW5qasImf+OO9Vr
         4Hza4Edu1fPlAqL9zUTDfLD9M0rJRtrZtDKPCKKtOcnaHc+YAbMItzhBLnylvxwujGd/
         pr3yjqJ1PGohSJ3JgYk7dM/G84JWIvkB8kXdlgr3p5VTvYj5ENgRjYiff/PrRWZKuNga
         z30KB/xtZz/OE31ppBhOsGS/Yjs3NdRdMUFDHP4ARUB8Nl5kKzpEUVRYkYsEVPSyWv/S
         oMZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765275413; x=1765880213;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=7jqYN1k2sIIVDynNkGogy0+4dYc363N58InYK+olTwA=;
        b=Hyy3YAm7BwKzxk0pkojmBxAYfIZRNOBeLKqoDxg7iLQPp0LHE/vwBbaUrWPuCIX+N+
         Fve+TL2ZXY5eTNRlVaX4reUuHeWpE/5UErIsiL0qLTmLRdCWY7eaMwwcnuTZCXSott2n
         yEob2BUrYYFAUqhVOC5t1jeNKSHxmavG4ry1WpvpnsxUBfVkx6l3j7s8YAC6MfQjF/yT
         kYJOf77ldM7h4THV10E3/fyGOPiVhAcsax1imfpnMKuS35xE7LK7hK4NgxxJp8M+2Kn5
         SQb7S8SexFrrmduWBmpenvWQRjjoSquYBelMolD81jFP4dfngt7Xwv0HowaPQ2qBK3d/
         2Q7w==
X-Forwarded-Encrypted: i=1; AJvYcCVvg9Ju9wWo0RNe9+2fpzJR47Xd+WqIdUzEWVgaUkrT5Ap49Jt1CVM/9vkun5Ipba25U+MFmPUtS2M=@vger.kernel.org
X-Gm-Message-State: AOJu0YwkXIHlt+aZtTQ9pZmAfDZoP4iyzQUdPsWGF4ZXrZO/QvpHGPHV
	EnXBRUiw8wl1hxZeinCqXqJuqT4UBrwnQfF+Zc7zWjynrylgIst0qmpm7ujMo8WB8eU=
X-Gm-Gg: ASbGncu/crKhtnZ/J92a8FhlsU/agIwQo5GI5s5a43dfL4oB14kuR50082Et9oACOQj
	EIZTK2Qh5fJMLGNRPlKqAPnB+4myL60l/U/zQT7PqjSXN1cdjnq7/g4X6/OATtignRqjAbxUXoZ
	wKzd049QdxwVDuAsgYVa6520CGW+XJe4AJuNTm4LZ9XFpgfpIN6NQCoMN7NLodCOjDr5sHFffET
	WHLYlKoqjaajSuDFwDo08WQY7tEB657AEyaaiqr+FpKu4kkuFkojp55RRhZgY8J6RgvBh3RxzOu
	cu4vd2S+yFhps23RAa6//rYce3a5Sqb2Zl8x5l5WDbSGCwatt7MbemwKbMzDR4DqJaqgB3ZWndU
	hB0ElBnKo0LunsFlDk1mAvLUnZU4Wm6UhwJp5+A0E94PWQ240ARPJshKWxPsVtocH1oIALlQM7i
	SHjdJ+fIMtLg==
X-Google-Smtp-Source: AGHT+IGYLG3rhZdJLL1r2IWmCryy/+X0jCUOg6jWuDZZCpYYA9nn3V/pWnZyhAXTJz8/W4BJn1NtMw==
X-Received: by 2002:a5d:42c4:0:b0:42f:9e8d:548 with SMTP id ffacd0b85a97d-42f9e8d1ee0mr1375634f8f.60.1765275413393;
        Tue, 09 Dec 2025 02:16:53 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:f9ab:1ddd:a971:a17b])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-42f7cbe9032sm28891327f8f.1.2025.12.09.02.16.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 02:16:52 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Jian Hu <jian.hu@amlogic.com>,  Xianwei Zhao <xianwei.zhao@amlogic.com>,
  Chuan Liu <chuan.liu@amlogic.com>,  Neil Armstrong
 <neil.armstrong@linaro.org>,  Kevin Hilman <khilman@baylibre.com>,
  Stephen Boyd <sboyd@kernel.org>,  Michael Turquette
 <mturquette@baylibre.com>,  robh+dt <robh+dt@kernel.org>,  Rob Herring
 <robh@kernel.org>,  devicetree <devicetree@vger.kernel.org>,  linux-clk
 <linux-clk@vger.kernel.org>,  linux-amlogic
 <linux-amlogic@lists.infradead.org>,  linux-kernel
 <linux-kernel@vger.kernel.org>,  linux-arm-kernel
 <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v6 2/5] dt-bindings: clock: add Amlogic T7 SCMI clock
 controller
In-Reply-To: <4f5ec838-f8d6-4c3b-94f2-b2a60cfe64ec@kernel.org> (Krzysztof
	Kozlowski's message of "Tue, 9 Dec 2025 07:01:44 +0100")
References: <20251204053635.1234150-1-jian.hu@amlogic.com>
	<20251204053635.1234150-3-jian.hu@amlogic.com>
	<20251208-independent-warping-macaw-74a169@quoll>
	<dd90b445-bafb-46d4-8cec-e0877cf425b3@amlogic.com>
	<4f5ec838-f8d6-4c3b-94f2-b2a60cfe64ec@kernel.org>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Tue, 09 Dec 2025 11:16:52 +0100
Message-ID: <1jy0ncvu23.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Tue 09 Dec 2025 at 07:01, Krzysztof Kozlowski <krzk@kernel.org> wrote:

> On 08/12/2025 09:40, Jian Hu wrote:
>> Hi, Krzysztof
>> 
>> 
>> Thans for your review.
>> 
>> On 12/8/2025 2:17 PM, Krzysztof Kozlowski wrote:
>>> [ EXTERNAL EMAIL ]
>>>
>>> On Thu, Dec 04, 2025 at 01:36:31PM +0800, Jian Hu wrote:
>>>> Add DT bindings for the SCMI clock controller of the Amlogic T7 SoC family.
>>>>
>>>> Signed-off-by: Jian Hu <jian.hu@amlogic.com>
>>>> Acked-by: Rob Herring (Arm) <robh@kernel.org>
>>>> ---
>>>>   include/dt-bindings/clock/amlogic,t7-scmi.h | 47 +++++++++++++++++++++
>>>>   1 file changed, 47 insertions(+)
>>>>   create mode 100644 include/dt-bindings/clock/amlogic,t7-scmi.h
>>>>
>>> Where is any binding doc for this? Why is this a separate patch?
>> 
>> 
>> The ARM SCMI device tree binding specification is located at 
>> ./Documentation/devicetree/bindings/firmware/arm,scmi.yaml.
>
> Then git grep for the file name - there is no such compatible. Are you
> sure you follow writing bindings doc?
>
> Think how are you going to use these values. You will have phandle, yes?
> To some controller, yes? Which one?

For the C3 (I believe the T7 is the same), the compatible being used is
"arm,scmi-smc". It is a generic one documented here:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/firmware/arm,scmi.yaml?h=v6.18#n202

The phandle used is a subnode of that, to clock protocol:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi?h=v6.18#n116

Same things is done on imx, stm and rockchip platforms from what I can
see.

Jian is just adding the arbitrary IDs used to identify the clocks in the
FW. I don't think there is anything out of the ordirnary here.

Is there something else Rob and I missed reviewing this ?

>
>> 
>> Certain secure clocks on the T7 rely on the ARM SCMI driver stack, which 
>> is officially supported by ARM.
>> 
>> The kernel-side SCMI client implementation resides in 
>> ./drivers/firmware/arm_scmi/.
>> 
>> To enable ARM SCMI on T7, three components are needed:
>> 
>> - Kernel-side definition of ARM SCMI clock indices (this patch addresses 
>> this component);
>> - SCMI server implementation in the ARM Trusted Firmware (ATF) running 
>> at Exception Level 3 (EL3), which has been integrated into the bootloader;
>> - Device Tree Source (DTS) configuration for ARM SCMI clock nodes (the 
>> DTS changes will be submitted after the T7 clock driver patches are 
>> merged upstream).
>
> So silently you keep the users hidden? No, I want to see the users.
>

Is there a new requirement to submit the DTS file changes along with the
driver changes now ?

This has never been case before, especially since the changes are merged
through different trees.

>
> Best regards,
> Krzysztof

-- 
Jerome
