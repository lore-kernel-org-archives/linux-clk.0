Received: from mail-io1-f41.google.com (mail-io1-f41.google.com [209.85.166.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 089131BC3F
	for <linux-clk@vger.kernel.org>; Tue, 13 May 2025 20:36:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747168575; cv=none; b=hd6DzCb9svSgiqhYUP6WzXp/+zPe4cSmXrhKUjy1pm1mJRco6mMMQezLDYq1rHE/7MfYFgVKqlLGC3kkdGFIJyWskgazkEgy2rnQX4mpXZbEr98Kc58MKsYeRfagXQ3Ax3GB9x7oiId3ek8aIr3r79fNGyZlDKihPcXVj8bvOA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747168575; c=relaxed/simple;
	bh=5LLRBHA4RbQdiR5KNtH8yV15ZdswH3CB9WS90/GuQhs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jwWc3uTKdUe+XSC61vPrydxP3MU1pad7CRaD4Wh+wPLXN7kQprYt0aJCFJ93Z8ZA0IG3dDrd1IRsAEqr+r0WRAr/yAXiNHKshkFmXK1Hr/yzNU4J6XWW5miPumLX18XTmG+ua1Oq+Z30FaID7TxA1X7m3PNdtg4vG4xpbrEETbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=UdGKgdcu; arc=none smtp.client-ip=209.85.166.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="UdGKgdcu"
Received: by mail-io1-f41.google.com with SMTP id ca18e2360f4ac-8647a81e683so149602639f.1
        for <linux-clk@vger.kernel.org>; Tue, 13 May 2025 13:36:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1747168571; x=1747773371; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vQAC3le+BCYy2YLab53jAJm9W1rrEw9K9lEKqtin1Pk=;
        b=UdGKgdcunwZ/zuEY61GV4LNkLq0ELW5aCgjrXOK4SPNZtF7TJ/Y5pja4oBlbbahJJc
         3rJGBcUDMADfTzrVjqQ0Vjr/ZV/kIx8aT7Pp3ey5kmwJ2/LESTpyD7QQNKIv6ZCdhfGK
         jrusSUhWs0Fnok6+gwZatKS35CLwotvtjeZ3AQ5eb7Qp0xQq5Ub02cjLQ5rWVTqCIzmB
         cNwOgec7nCIvvzTBipPquSNYfTVOZsYC6xfcIxnTMHfTHomZBa2njToGH5T2z7vjFe9v
         9GolDCzW0793noRi+iA5DKdDmht9LeEhP/t5cDkx2XOw5svxXcooSns0t6m//drjMtc+
         Umhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747168571; x=1747773371;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vQAC3le+BCYy2YLab53jAJm9W1rrEw9K9lEKqtin1Pk=;
        b=Y5iFasTKpCRCdYy9Gv6rQai1Wbxs6cVVrFkml12hKq76yuAVvMGnfC7hdSfaN4Fyqp
         77ntljKZkWf+P4GWLTXukOSPFe4oI8J2UWk6ElTXRfF1PIegoT72wlgN5YnK2ploAMMd
         99ApJLiS3cQWh4a9slasSvMFBUlH7lgEhUfsP9vAgniqFbgKCzN9kgQxDufxBur7s1Hg
         Igfgjqyia0/unE9irFl7x+JWqd2TBwPpDVuGr2AdqYdzeZcyu4DXJGwTbMtvyt931izE
         vYrcrtHJLTqew11G7zZF49Z1iqCWac1VwHA1ykYzbCtNDOZxJZLkdSQk1OV6LPoBt+fZ
         fP2Q==
X-Forwarded-Encrypted: i=1; AJvYcCUVILwReq6gT+j4VD+6lXH7kraDZyZ7OBEBpdtvZXAJbImJwApOkoRfyPbVnZXmUGcB2hS0ITdERmA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyl+AQ7FyOoaC7q1D0gXLK64KnH63+JEpd47h7Xdpi8ggEv+BSa
	RC4YEIo6Xa3toyhMn55jI+814pWKuSMpS/4hSl6PTJtaJqW5G0+Y0xXjTvqkqks=
X-Gm-Gg: ASbGncuRd29KrTQw6fJWF4ciZhTlPJQzrcQy6/33Oi3/gk4T4n/4tWxdMiCYzKqSv00
	M//4YA9YijLAmNBtlq8cleoAM+aybCYpMSYHOEe+1PSBbyn423nejT/L7jvAydj6xSG6jMXtw9V
	yD4wjGLTT0n11qZCinrPt46nDyLu0/PZDMijdS3LkHAt30V3LpyHvnlSyagPqsJagq1ZMuz4KbK
	x8Z1vtG+uF038yFot2ygwL+Kh9prZQiPLJnAMBfKdOOF8skTuaGi9zNtgyDKqafWbj+z3ZqJZCN
	Q7UpWtG6EICvmBEmTmPOG2TrrehDxANofEzCXM5CQpVHvIIhzkL/Po5lIdDLGKbJjPmQI5cqMA0
	nFUkOMqV6+xy3Ymw=
X-Google-Smtp-Source: AGHT+IGmcYzrawJPrdx830TjmfHvKcMCTm3YWEkQZLVMVtIRd+wF9lEoF07B//54gt57mIaMgWnBSQ==
X-Received: by 2002:a05:6602:6ccd:b0:867:237f:381e with SMTP id ca18e2360f4ac-86a08db2c12mr94293839f.2.1747168570986;
        Tue, 13 May 2025 13:36:10 -0700 (PDT)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4fa22524b94sm2255602173.63.2025.05.13.13.36.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 May 2025 13:36:10 -0700 (PDT)
Message-ID: <62b44c17-442f-425b-bf9a-56c9d4eb2468@riscstar.com>
Date: Tue, 13 May 2025 15:36:09 -0500
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 5/6] reset: spacemit: define three more CCUs
To: Yixun Lan <dlan@gentoo.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 mturquette@baylibre.com, sboyd@kernel.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, heylenay@4d2.org,
 inochiama@outlook.com, guodong@riscstar.com, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, spacemit@lists.linux.dev,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250512183212.3465963-1-elder@riscstar.com>
 <20250512183212.3465963-6-elder@riscstar.com>
 <ecf46fa3116690b85f51539edf7f6a47c612fca5.camel@pengutronix.de>
 <20250513201208-GYA518096@gentoo>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20250513201208-GYA518096@gentoo>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/13/25 3:12 PM, Yixun Lan wrote:
> Hi Philipp,
> 
> On 11:21 Tue 13 May     , Philipp Zabel wrote:
>> On Mo, 2025-05-12 at 13:32 -0500, Alex Elder wrote:
>>> Three more CCUs on the SpacemiT K1 SoC implement only resets, not clocks.
>>> Define these resets so they can be used.
>>>
>>> Signed-off-by: Alex Elder <elder@riscstar.com>
>>> ---
>>>   drivers/clk/spacemit/ccu-k1.c    | 24 +++++++++++++++
>>>   drivers/reset/reset-spacemit.c   | 51 ++++++++++++++++++++++++++++++++
>>>   include/soc/spacemit/k1-syscon.h | 30 +++++++++++++++++++
>>
>> Could you split this into clk: and reset: parts? The reset changes are
>>
> Do you have suggestion how we should merge the patch series in future?
> What I can think of
> 1) take patch 1, 2, 3 via clock tree, and provide an immutable tag
> 2) pull the tag, and take all driver/reset via reset tree, and provide an immutable tag back?
> 3) take the split part of drivers/clock/ in this one via clock tree

I discussed this with Philipp privately this morning.

This series builds on the clock code, which was accepted for this
release.

If I separate the clock from the reset code into two parts, we
still have two header files that have updates, shared by both,
so those headers need to be pulled in first.

I think the easiest thing to do--if Stephen is OK with it--is
to have the entire series go through the clock tree for this
cycle.  It avoids any need for coordination and will just
get things right.  I think there might be a trivial merge
conflict, and I'll call attention to that when I send the
patches.

I will explain all this in my cover page for v10 of the series,
which will have all the signoffs.  Philipp said he will give
his ACK.  We'll then see what Stephen decides to do.

					-Alex


> 
>> Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
>>
>> regards
>> Philipp
>>
> 

