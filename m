Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A81463DA5C6
	for <linux-clk@vger.kernel.org>; Tue, 28 Apr 2026 09:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777369678; cv=none; b=rM7qd89A090Jkb7+9YMioTykiH62SFMq5NbRznMbblqeBzMdSE8ldyoEaHerrLrQV0YQPLW+0Aa00BVZJnPoKGTu4reKy0oqqae8PgmdrK781ltDP9QYMl3ja8RUrFfFP6JlULacaFTXvk7+JE9FLDlctYcAVlE+8y1U4zbPpRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777369678; c=relaxed/simple;
	bh=1s3zoV2UGzWKIUYJTiOORY7/gFXs9hQgskCHHMAdMIY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uq1qRnWmQJiQqtF7SMfMQqmN/jQOMc5mN1YWI6zmp4liqkfxyD/ulPXgfpTPSg3JMEPKpYs3OJyhRAGHuWhIzuH5ICtT2mD3vlZeJYYkzKlXnV+7kgVYjuQwirYiM0PpSWRUgxSgX3AN4qcDjaA1196UIpGstW8PTrWSVUVTntQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZKO4vWik; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZKO4vWik"
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-7982c3b7da9so106179237b3.1
        for <linux-clk@vger.kernel.org>; Tue, 28 Apr 2026 02:47:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777369675; x=1777974475; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rFFNaiD3e7rjmKA/oxd0MaN/8EMgqV0cx8JEjl2p0DY=;
        b=ZKO4vWikvtUIE8J9qnJMqCLQWdKSWMUwhsxjk0E3wNfr8Z9nlt0cJG71SpOcZ/81Kb
         nvPcRM7y9/SZVWbFZ894Im9obwBcHVuwMuTFLJIKg3rGdzi+ziMvdKVw+rc6hz9Qx/xE
         Wmc5N0MZjRhPKsmdiTQ69ed431RhJUcpHggKT85MZRXBkZNm5feRhcLDqeuw3PRUUEA7
         R2kcBT3tNdJFj3wi5x+hBhmiePzBUhch3iAZDsfZnXTH48hfkkhx6/jWNuf6YHvv/frk
         cSfh3WQrMgO6Iuy7PYwYC0loPGAfCS9ldMRFCdjye37H5O/m733eNt35F3Okugn4Odi2
         1Sag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777369676; x=1777974476;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rFFNaiD3e7rjmKA/oxd0MaN/8EMgqV0cx8JEjl2p0DY=;
        b=Tb4sw5Mk3Xh4A6YIzCqSGThjJ/aVA+Fk0t1w/K22MVKznCfPF6eTe2r28N+2fGLOa4
         8BohqHv5hfiiXzT4qir3Yn/8Kex2M4o7COo6ykLg3815Nwowi5KIFmw0lYmYQDcTsuV7
         qgr16UXBLiL5uvHxsat+Csmo/FWArOHlTakDqVXkk0Aofb+PVx/ViUK2Cxgqx998NQyM
         E+V58z09HZ8IGzM/EYwCwinraHpbwx0cGSqv4xFkdQkoIp9ZP6h1FHH8nCWrc9lrTOSP
         sOIoSqvoLKwbIQqCtrAqW/6Yd/z+n4GeTQMxbHyWv3zVNKDi7nn4VbtlnTpM0ciVh7d8
         AONQ==
X-Forwarded-Encrypted: i=1; AFNElJ9fR3/aGFLBR8p4V534SFnK9yipa2ViRgacmvbnnwulGZRNopU2WvejI5fqzAUesf1Az9GkOU16qEI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzuLnNKHSrehrDg/pa7AMbGMPAx6nIwd2586W+alESZjgJg+OJu
	GJhyBd6+99PoDqktBeOGWM5PJIMg3elu8+QO3dMiCg+c7EoZV40ZqYuD
X-Gm-Gg: AeBDietyYHMr3NsEG3/kRQOgoxwMiFWQm2bmL6iz8S5aoDEK5XNR33NbJd7D+QKYG2P
	gj273wODKTaCUq25s9ye+2UfFS+72pDJBweiaZacX5hmlCVnvDlweXqKjWH5MS2jTmoItFrHii/
	+xzOV+fupZ/HggAYtvwlI7oqR4JCFx8c/2zU4OuERM4H//SBpxxa4mjXSGUxD88sxt/UF1M7kMO
	fn3wr6acYuigH1tixWPrWvAtan8/vQA+P1NL4SI1HbFQJSkXL9nN3vAwzmip+i678CgDQYNgarB
	tW3D1CHTaJoxISO+DgcO3HFCMVwsRZ2BQBIM8NfJZh3fFnLQEIRSNaSvfq6bn9X4G65HdoKBrWd
	1kVfL45bZZEPgz++8T434tCdmFFsAMyxY5Qf9jtwn6V4rAQ4mp7E9NWBcWudUPUcLUNRo6dtQIP
	0lu/6p3EWoX7THH/u7sNN9vUIYhniYVOefQcIx
X-Received: by 2002:a05:690c:6e86:b0:7ba:f2f1:86c7 with SMTP id 00721157ae682-7bcf50d07d7mr20810327b3.1.1777369675548;
        Tue, 28 Apr 2026 02:47:55 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7bcf05e4740sm14218867b3.14.2026.04.28.02.47.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2026 02:47:55 -0700 (PDT)
Message-ID: <34627be5-75cc-469b-af23-f1f08ce29820@gmail.com>
Date: Tue, 28 Apr 2026 12:47:48 +0300
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v3 04/11] arm64: dts: qcom: msm8939: Add venus node
To: Bryan O'Donoghue <bod@kernel.org>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, =?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org
References: <20260427-msm8939-venus-rfc-v3-0-288195bb7917@gmail.com>
 <Xfiq_WNTU9P-ThZLMs4plWE5hwtmwyVyKJc1bD5BKdhERGouucNpyuenIoKQiKfZKaRzP-PdamsNlQ8vezjrRg==@protonmail.internalid>
 <20260427-msm8939-venus-rfc-v3-4-288195bb7917@gmail.com>
 <56d609dd-62be-47eb-8ba3-c5d70d773113@kernel.org>
Content-Language: en-US
From: Erikas Bitovtas <xerikasxx@gmail.com>
In-Reply-To: <56d609dd-62be-47eb-8ba3-c5d70d773113@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 4/28/26 10:10 AM, Bryan O'Donoghue wrote:
> On 27/04/2026 18:58, Erikas Bitovtas wrote:
>> +            video-decoder {
>> +                compatible = "venus-decoder";
>> +                clocks = <&gcc GCC_VENUS0_CORE0_VCODEC0_CLK>,
>> +                     <&gcc GCC_VENUS0_CORE1_VCODEC0_CLK>;
>> +                clock-names = "core0", "core1";
>> +                power-domains = <&gcc VENUS_CORE0_GDSC>,
>> +                        <&gcc VENUS_CORE1_GDSC>;
>> +                power-domain-names = "core0", "core1";
>> +            };
>> +
>> +            video-encoder {
>> +                compatible = "venus-encoder";
>> +                clocks = <&gcc GCC_VENUS0_CORE0_VCODEC0_CLK>,
>> +                     <&gcc GCC_VENUS0_CORE1_VCODEC0_CLK>;
>> +                clock-names = "core0", "core1";
>> +                power-domains = <&gcc VENUS_CORE0_GDSC>,
>> +                        <&gcc VENUS_CORE1_GDSC>;
>> +                power-domain-names = "core0", "core1";
>> +            };
> 
> So to be fair in this case you do have a reason to have an encoder and
> decoder compatible here _but_ it should be the case that one one of the
> sub-devices contains CORE0 related stuff and the other CORE1 related stuff.
> 
> Because in that case the sub-devices actually represent individual
> hardware settings.
> 
> So listing power-domains and clocks for both cores in each node like
> this militates against that.
> 
> The other thing is to double check of the encoder and decoder are inter-
> changable here i.e. can either core be encoder or decoder or is it fixed ?
> 
> I believe on older generations - perhaps not on 8939 it is not
> interchangable.
> 
I found this in LA.BR.1.2.9.1_rb1.5:
https://github.com/msm8916-mainline/linux-downstream/blob/b20608408caff817ec874f325127b07609fbaeb8/arch/arm/boot/dts/qcom/msm8939-common.dtsi#L1589
Only decoder bits are being set in bus configs. This suggests that the
cores are not interchangeable.
Then again, I never managed to get encoding working on MSM8939. Testing
it with
gst-launch-1.0 videotestsrc ! videoconvert ! v4l2vp8enc ! queue !
v4l2vp8dec ! xvimagesink
Fails with the following log: https://pastebin.com/nmZcLgPV
And in dmesg it reports a firmware error:
[  784.461031] qcom-venus 1d00000.video-codec: no valid instance(pkt
session_id:dead, pkt:21001)
[  784.461126] qcom-venus-decoder 1d00000.video-codec:video-decoder:
dec: event session error 0
[  784.461200] qcom-venus-encoder 1d00000.video-codec:video-encoder:
enc: event session error 0
[  784.468799] qcom-venus 1d00000.video-codec: SFR message from FW:
QC_IMAGE_VERSION_STRING=VIDEO.VE.1.8-00099, Err_Fatal -
Z:\b\venus\utils\src\vbuffer.c:1319:
[  785.791641] qcom-venus 1d00000.video-codec: System error has
occurred, recovery failed to init HFI
[  787.018339] qcom-venus 1d00000.video-codec: System error has
occurred, recovery failed to init HFI
[  787.097253] qcom-venus 1d00000.video-codec: system error has occurred
(recovered)
This happens regardless of whether I enable the cores for encoding too
or not. The same errors were happening on MSM8916 as well. So I can't
tell if these cores are interchangeable just by testing.
