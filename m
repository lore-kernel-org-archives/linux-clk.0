Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.138
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793093515;
	b=hEKEmJInpI6lu+Ipg+fGCYybpZkaS3954Waj0a9B9feJJ2TPyafczI9TMOAwVWqtculJ
	 GxX+aBvp3WEG8WzYPzC/3m6NWYl5h7BloVcatnwTxZXOxTvL20u66pHGekWvQWfNbo1ch
	 oepRL9tOhU91P16Bj5zad/Qj0WShTmT+tZTafRuld95dULcjX8uiB8D0XtC+oWxYjDIcL
	 ChNT5Wui4Kbn50K9S3bOETK0Q3Yh8HIR8oTdnpHJbHqMo1zskL9unsOwmYE/v4SlAhrJi
	 HhofQtjAsfQotOv/Mb3JqkWJgqYrm6XJajcMCyCmWi2zLX/foptypHl26Kw95/Y27uw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793093515;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=0lp8ix384KyuQihbhJDejl7Hsm+NKly5D1mQFcd+Ymw=;
	b=ZYTjYbLbbGHrKeNmOoFtluNaHPaMIZorY23ZxdXDqoK2jZfB5E4Zx4tb3fMMXQP5+2Vu
	 grP/Gk7IHmGbSxTuF4FF6ilrEvKbcFwmCpo7Ms9MRiJegm1dTtxgWpKVO+NFyAEnHkyDR
	 flEp7NU4P7U0IfRh0i0ZWCEv5Va6UdaSXWdrjcuMQL1TO3RAv4py7lgSpXerCgivIsMZs
	 sIJ94ghyljbljPyY/qXN9AM4DUh0z+yKTEzwwD+iX28G+svptH4yK2tctDuuiXDlKS/1F
	 ECwNeAf9JMg28aeeQvUu9cRymmaQwnq4VJOxobtAihRpIQviAo9ayKqZp1DuDzFP9eg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=sq2fTXIs;
	arc=none smtp.remote-ip=74.125.227.138
Received: from mail-pj2-f10.google.com (mail-pj2-f10.google.com [74.125.227.138])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B802606A31E
	for <linux-clk@vger.kernel.org>; Tue, 27 Oct 2026 09:31:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B802606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=sq2fTXIs
Received: by mail-pj2-f10.google.com with SMTP id d9443c01a7336-2df921c1d0eso16555945ad.1
        for <linux-clk@vger.kernel.org>; Tue, 27 Oct 2026 02:31:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793093514; x=1793698314; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0lp8ix384KyuQihbhJDejl7Hsm+NKly5D1mQFcd+Ymw=;
        b=sq2fTXIsEYbEUtg0IqcDKMHteJoXYOAwMDyVqzIZfLLacj5r2gHuBfSfVl8SDyy//I
         Tgb1smw70VKqwN+dX7VApNE2E06pGewPMGMOz5yPZqhk+5pB4o3STGObkK3bQaHabu4Z
         vKfn2epktM8g9ZRjHpbg0zdov6W+IhCKQEfddtM5iOoYqxKzxwH5UJvsqwWkmbhJRPt6
         ig1SSiA1WHltZOvqZVm+1xYWO4y0e7xlazNAlOi8z8KfyeVRmCE5lAJS81DSqE3PxT3W
         lZn0JcA5XH6KEsoIoxJHZ9nq3LaW8OztyM6SvlC5W86KkD92x1DZXIuLwBrr9JtjwLoO
         MZYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793093514; x=1793698314;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0lp8ix384KyuQihbhJDejl7Hsm+NKly5D1mQFcd+Ymw=;
        b=gG0dWs/vV+6NwQqgktJuACJOANvd1lZkJnYUZCzuwu3qg1j6NB8ETM2UKMX9t5QufS
         /0iLFMkPa7MHTVv2vzw7CnRvi3ubq1oUpUI/V06g4Hk48QwgUTKNOVNE0CvZFssHTecc
         Tio6TfTUHlIGAURf1vm6GoT5K4AHJG5MpYlxHV3fK661+DLLEPh8jWpNlp2Z/z5P+NX5
         IqlhY0+bwzqJFERn9yIjUqXfCqk9RK9FF1T96LWA5fBBXly21MUldwAS4kBvZwPajB+X
         vJ0XqdHXifdCA7b//1UiYyv0pwBJUDK+yEc2GnR5B+lh6ffpR6s+dU3rcCxEFM7JXuk6
         TsnA==
X-Forwarded-Encrypted: i=1; AKwUvBz0kL/ef3fJVjDyxpCAUwPCrMVuFleDrUDM0ysivBFiGF+nfVcfLxaVVc23vDqfk2YQvQnmHhJyym8=@vger.kernel.org
X-Gm-Message-State: AFq9FYKl5RzRHdI2qUpS3x9y8tjLq2QlSIWz/Hh8Mf70iDj6MCr8G/45
	NU1qsjY9V2Fboa+gU1HRDFXfAusyUHsKNliVvxqILWg3a4BdSw4fKnTv
X-Gm-Gg: AYBFou2bd87FNYKNB6nwGO6U56y7z6diy26XnYABqt6e3y4cphMKJolvKDTydXprW6K
	+1kS/otTrMi2MIzSoELqVQ/sUokG9hsApY0Z+bgBi36WMR22GJyOMD8scouuCtfRJSduBnTOy2d
	kbzy2G3gSn6wWMTYTMOaWikBHRTHzKsogVDA34Rmzh//ku4/4q2kxQoq5DUu295CmQKNcq5b8uf
	fmheV2l/oQYfcHVpfjVPgPvue3Az3/7YNoNrfSq4IRj9+awWaRLMy+1xolGy2goqKzcJtkkcvB3
	Ejnxpkkrjbg2eSkbLiu94Knc2sZjLNPteR01u8a3osEGeUMDoBgk6K7FDyWbNNThus2u2UDYtl0
	R6IEvJrDsmEOK+RucIgnj1lrHaRZPWzXQxv4beCTWPgd5On4rnNjoEjOf+Gu1iXtDDMiltGPtT1
	SkDblx02E1KVZ3QtXf6nXPKmflOReU1lsThu+XkTTogj2hbFWjG5ZrPHWmDTyJJ+UQXYH6ta4/s
	kS3V6arenPv9Vw9LOXXfEu17DAA6kFHmTw0mDUuQ+uAbZrk1mM9y63RJRimPenhw20VfcsGuFy8
X-Received: by 2002:a17:903:3c6c:b0:2e9:7719:4104 with SMTP id d9443c01a7336-2ea9c03f2ffmr86182255ad.8.1793093513672;
        Tue, 27 Oct 2026 02:31:53 -0700 (PDT)
Received: from [0.0.0.0] ([129.126.71.118])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6c9757bsm6281855ad.58.2026.10.27.02.31.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 02:31:52 -0700 (PDT)
Message-ID: <e9764219-8afc-4e8b-985f-9611b0c9a28f@gmail.com>
Date: Tue, 27 Oct 2026 17:31:44 +0800
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] cpufreq: add an Amlogic speed-bin driver
To: Jerome Brunet <jbrunet@baylibre.com>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 christian.koever-draxl@student.uibk.ac.at
Cc: neil.armstrong@linaro.org, sboyd@kernel.org, bmasney+clk@redhat.com,
 khilman@baylibre.com, martin.blumenstingl@googlemail.com, rafael@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 =?UTF-8?Q?Christian_Stefan_K=C3=B6v=C3=A9r-Draxl?= <ckoever@outlook.de>
References: <20261025192219.209137-1-christian.koever-draxl@student.uibk.ac.at>
 <20261025192219.209137-5-christian.koever-draxl@student.uibk.ac.at>
 <at7lXEqds7ukoR2V@vireshk-B250M-D3H>
 <1jbj8gkff1.fsf@starbuckisacylon.baylibre.com>
From: Chuan Liu <chuan.liu686@gmail.com>
In-Reply-To: <1jbj8gkff1.fsf@starbuckisacylon.baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Jerome,

On 10/26/2026 4:57 PM, Jerome Brunet wrote:
> On lun. 26 oct. 2026 at 11:00, Viresh Kumar <viresh.kumar@linaro.org> wrote:
> 
>> On 25-10-26, 20:22, christian.koever-draxl@student.uibk.ac.at wrote:
>>> From: Christian Stefan Kövér-Draxl <ckoever@outlook.de>
>>>
>>> Every S4 speed bin runs the same CPU frequencies but needs its own
>>> voltage curve, and the bin can only be read through the secure monitor.
>>>
>>> Read the bin from the firmware, select the matching
>>> "opp-microvolt-speed<bin>" property for all CPUs, then register
>>> cpufreq-dt. Bins outside the known range fall back to bin 0, which
>>> has the highest voltages. Like sun50i-cpufreq-nvmem, the driver binds
>>> on the SoC compatible and needs no node of its own, and S4 is added to
>>> the cpufreq-dt-platdev blocklist so cpufreq-dt is only created after
>>> the bin has been applied.
>>>
>>> Signed-off-by: Christian Stefan Kövér-Draxl <ckoever@outlook.de>
>>> ---
>>>   MAINTAINERS                          |   1 +
>>>   drivers/cpufreq/Kconfig.arm          |  14 ++
>>>   drivers/cpufreq/Makefile             |   1 +
>>>   drivers/cpufreq/amlogic-cpufreq.c    | 184 +++++++++++++++++++++++++++
>>>   drivers/cpufreq/cpufreq-dt-platdev.c |   2 +
>>>   5 files changed, 202 insertions(+)
>>>   create mode 100644 drivers/cpufreq/amlogic-cpufreq.c
>>
>> Is it safe to apply just this one ? I can take this via the PM tree then.
> 
> I would advise to wait a little for Amlogic to chime in.>
> Patch 2 is something I already rejected back when S4 support was
> initially introduced. I suppose AI just unearthed it and did not bother
> to mention it.
> 
> Amlogic was supposed to migrate to SCMI at that point, and possibly
> handle CPU frequency scaling through the secure fw entirely.

Yes, starting from the C3 clock upstream submission, we replaced the 
SMCs implementation of the secure-clock with SCMI. For the latest 
released Amlogic SoCs (S7 and later), secure-clock is implemented 
uniformly through SCMI.

> 
> They did on later SoCs, I don't know where their FW stands on the S4.

Most S4 customers receive a secure firmware (bl31.bin) that sets 
secure-clock via SMCs (because the S4 SDK had already been released by 
the time we added SCMI support). We have also provided an SCMI-capable 
bl31.bin to some customers.

> 
>>
>> -- 
>> viresh
> 

-- 
Best regards,
Chuan

