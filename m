Received: from mail-io1-f53.google.com (mail-io1-f53.google.com [209.85.166.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F6ED2DEA6E
	for <linux-clk@vger.kernel.org>; Mon,  7 Jul 2025 15:18:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751901510; cv=none; b=seCX0VLt37xmhbUacN251dcPeR7GiAyXj3A6TdYYs/bU4bdGDMhgQ+MqFGUwxKJjUtfeVbgg1nzaaGFthl3ljEgQ23pA02hnRy2OMV0iCXM/Yk6azWl9FMWjrXF/nq2bEWeCodGCyc6exQ3VZ8spFibRr8NdXMBxNCg/6jt9+Dw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751901510; c=relaxed/simple;
	bh=UYxbzP4enqvlZLYbDydbT2B0N+b4fJfsrGskHaO7mtY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MaxW6omyktC8Mb6O+IWzUnCwO4uGZTuUSoJh0Km2HJ5lXetOmA4n//4W9P31dMW2dzVhsD86wq/yIpB3BBDx8FQGJWkUk/Ntded5MY0092x6ojpOOA7IesM8+C1zizMyJCw17UPOuJHuQa9C/q5U/aNhBRipidjpw/7LuxBnXQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=lTd9XybQ; arc=none smtp.client-ip=209.85.166.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="lTd9XybQ"
Received: by mail-io1-f53.google.com with SMTP id ca18e2360f4ac-86d01686196so97959739f.1
        for <linux-clk@vger.kernel.org>; Mon, 07 Jul 2025 08:18:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1751901507; x=1752506307; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yx5aXg6P6SNdPzRe+7UpHrkN5msdFi/K5+r1J0CI3l8=;
        b=lTd9XybQwpBOJT3TbATIzrfKo62rQLztUnHtBu+x4Wkf314fT62xe0IetcgJ+auXr8
         yrM8nB0Z+SYkmlcFrp8QF6gIxloB57ba+ei2S3uyWqy9EjbAZUE8cB7iVAb24tohXEF2
         DxN5PjNIcbPNIke9kIDZvmHSoWV1H5pbdfLKDEWBjpw4+I9PSshOz5X0eMAGgq8wEHw6
         XomR/hkaKphoJsk4nxmqL3eA0/tfKXWui09khK9eJF2nZTO1crryyjphB2btn1bxUXKW
         oc9zx4+qfW52PlvjRSu4ISeqshCIkS/Sn2MYcINKAj4qWYtVlk0brWxEnHC3O/xyI3+z
         zhNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751901507; x=1752506307;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yx5aXg6P6SNdPzRe+7UpHrkN5msdFi/K5+r1J0CI3l8=;
        b=Dytevf+teq7xEjQSnL1q4eeIQpzz5uBx4oH1xQ8+0MguIESOcRK9xBCKYcdwHhjWD9
         2rawhiI6H7tB8yhhWcJdRtwhIcr//bqyAQcV9TDFlZzZ4mIzl3nFDFU8GXMHq5zWdMGU
         YucCGx6ixx+LYQLboDrLF2TRcqL/sEizl+DcljoNCDFJsX+3q6b8C4aCp2hutFjM+Hes
         RtfKt9HRNc+oZl5w4fnjjTLoXpfLEFvnWhnf9/D8s93SbwT823R2hof0t9uE5TJUwh5W
         QMZuAHOm0YUv+ElTrhvVZLbgcgGwwLhlxBxcO7T3BojxoPnbWLjJXou1yZ+Y51xsZ4GB
         4buw==
X-Forwarded-Encrypted: i=1; AJvYcCWoD2RI2zIPk4KsjxgtJGxoCpoRmptMTVmkH2XBbIM4dtNa7uqGuJgBmxDE0R8omzdTXHKsk3Ik42U=@vger.kernel.org
X-Gm-Message-State: AOJu0YyG6v2iCvZmHFkbt7yLLMfSUOhXyDlSTlb947tmq7PEw9yf6yuJ
	MtDsa6fBvWSk0IqAniVC2w+5h5GRvF1g9j5U8KNG+bb6m0KEKVZWfKpml9JJzVgY+pmnIPFCbFM
	V840f
X-Gm-Gg: ASbGncsThglsXea/lKnQnK6OKkdN14g9pNdP+XikMYF4w5loItBpFd4lGrkgtWs4LUw
	fVPqBT3eNbD6enPSVdWidjEtDSOhax3AVCoR3URVC4460Gpi2Kgez8SZOZwFZGw7kiG+nkVp1ke
	YuYyZVM1vw1zJeyKA8A28VsydW9yVCd6myk/tTjSg/Rmnq9vFMGEEkuGZsvBq3Wag+6H6K0U5qC
	KPcQf/PGUMWR5gQGh4tQWle2xliOtFr7Utbh9tLhVPZ2IYJKNT0EXJ6Bc8v/VOVQROFeXh06Slr
	zv7Be8J95RFsfbH8c05vj8JhH3Hbx9aPCZLRbVxbnTUAuyXoBQd6Y2tAF59lGJGVuOatNmEYfrS
	Vmw7Vc/jxwf7vTwgMjkuCHEpB+Q==
X-Google-Smtp-Source: AGHT+IEcpAKi8rMSKDtA341deu1ji4vXPPPi4MsMqdh1gMhGYZ+finPoZ6kUswodqeMPhgepaUG+Cw==
X-Received: by 2002:a05:6602:1606:b0:875:bbf0:8bf with SMTP id ca18e2360f4ac-8794a3ae0bfmr1164439f.5.1751901507273;
        Mon, 07 Jul 2025 08:18:27 -0700 (PDT)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-876e07ba3fcsm238619539f.12.2025.07.07.08.18.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Jul 2025 08:18:26 -0700 (PDT)
Message-ID: <7e652d26-ffae-4bce-9952-4061b2799095@riscstar.com>
Date: Mon, 7 Jul 2025 10:18:25 -0500
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] clk: spacemit: mark K1 pll1_d8 as critical
To: Yixun Lan <dlan@gentoo.org>
Cc: mturquette@baylibre.com, sboyd@kernel.org, heylenay@4d2.org,
 inochiama@outlook.com, guodong@riscstar.com, linux-clk@vger.kernel.org,
 spacemit@lists.linux.dev, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250612224856.1105924-1-elder@riscstar.com>
 <7bdbef20-da43-4b23-9ae2-a0cf077fec92@riscstar.com>
 <20250707142846-GYB408198@gentoo>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20250707142846-GYB408198@gentoo>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/7/25 9:28 AM, Yixun Lan wrote:
> Hi Alex,
> 
> On 07:19 Mon 07 Jul     , Alex Elder wrote:
>> On 6/12/25 5:48 PM, Alex Elder wrote:
>>> The pll1_d8 clock is enabled by the boot loader, and is ultimately a
>>> parent for numerous clocks, including those used by APB and AXI buses.
>>> Guodong Xu discovered that this clock got disabled while responding to
>>> getting -EPROBE_DEFER when requesting a reset controller.
>>>
>>> The needed clock (CLK_DMA, along with its parents) had already been
>>> enabled.  To respond to the probe deferral return, the CLK_DMA clock
>>> was disabled, and this led to parent clocks also reducing their enable
>>> count.  When the enable count for pll1_d8 was decremented it became 0,
>>> which caused it to be disabled.  This led to a system hang.
>>>
>>> Marking that clock critical resolves this by preventing it from being
>>> disabled.
>>>
>>> Define a new macro CCU_FACTOR_GATE_DEFINE() to allow clock flags to
>>> be supplied for a CCU_FACTOR_GATE clock.
>>
>> Is there any reason this bug fix cannot be merged?  It was
>> first posted a month ago, and although there was some initial
>> discussion that led to revisions, this version has been waiting
>> for over three weeks.
>>
> Ok, let me explain..
> 
> I've queued it at for-next but haven't sent out the "Applied" reply email,
> it should be eventually merged for version v6.17 if things goes well..
> 
> the reason that I haven't pushed it hard for fixes branch is that only DMA
> is affected for now, but DMA isn't fully activated in current mainline
> (No DT, No config merged), so I think it's fine if we target for-next..

OK, thanks for the explanation Yixun.  I've been working in the
networking subsystem for a long time and they tend to push bug
fixes out right away (once reviewed).  But you're right, this
particular bug fix does not affect any currently upstream code.

					-Alex
