Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FAA328488F
	for <linux-clk@vger.kernel.org>; Fri,  5 Sep 2025 21:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757107425; cv=none; b=bxUOS5BzhjxLdIBh7s+ICgT5WuM3X7X8R+k+AIpJ6VO3eH4d5OGZTGk00389+YG6TBcLVDtP902rLChVwMzNmIzGoMzb6FGEFSqZ1b7HLDlc1X3wvIDYbUWs/7QS64mr7DQi823NIt1yATMshlKAl3OPiUw06yvwKtjlO8SDWtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757107425; c=relaxed/simple;
	bh=o/PqQhK0PKkxH5IBGjaZ5xFiBra8PzKV7+1t1tFVm/g=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=lnO5C6NZaKO5owBnBrkg9mOFZASYeRmoSPto4+FJpy/IIMPsPaHOSyK4q4xIO2uh9aV8kjzaQUhrQP8uJqfh0EEKjKEGfSV8wCwbpcnuadsfVKS7/pHvonK8npW4S0pSdAXKl41x3RZf91DLwIf5jXv5cFV5qHEfk1kZ6z2vJ4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=baylibre.com; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-7728815e639so1563057b3a.1
        for <linux-clk@vger.kernel.org>; Fri, 05 Sep 2025 14:23:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757107423; x=1757712223;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=W6wZ9HgdgMtQgRD7Hr86g025jE/p6E3Wse2CcjqMIiw=;
        b=CdHCFHH26jWxKtmDVpcNPzoHN7u4Td/oCDSlsCVDJ2pODFPZyRI0uSPEB2BqxMj5k/
         X6DhO+xeEay/9IzZTi5oZXD/bRL27hLqdyYTJ+h86LXtJ64dvRMwNnDsKrl4pzHgP/WI
         5PoFktf3tCFqJ/il5VKft+XwBksTveY5PQipBkQJ8g7FIeosWugSsAOfFS0Abeg2W3lc
         3l2qw7MSiU5hfYekK8dh9O0+T8uWKJAkxN8EHvtFqZqTX+HvSpgSfW6ggTcmc6VWqMRT
         eZv80IggDI/n6pinu69ntBer2PrYgCpmLn/y/XdmjjYb0Etuc2b57kIKTige1O0bTPR+
         lflw==
X-Forwarded-Encrypted: i=1; AJvYcCUMRSQ+9kIBa2/JVt/f8YonVjs5PLUq/guiKnPyVdzDspdCi0xiiAI2hvZOgvqw35sj5G8zCJwx3Kc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwJWk0BoJ8qaZvFaqBwXqko0OFi2PAcRV8Vjc4DorimnTqxwlGX
	l+I9FbtkJiXilLI3ei2Hxuwrt/uhOkc6rXJTEK//Mya29r8IhBfm0rhdpytTWw1wEj0=
X-Gm-Gg: ASbGnctDTjX2oBihdn4qj05fIDOJV/4cahV8OzP4DW1SGRVB9JQBsowPKfbvRbPTBcq
	jzSFxToErydZsAXcEsDoGN0xeWaPcqjpY+0/vRk0LvFyolx25Bs+k6Z2YCTmSMBnSESw2Z99Im3
	CiHKGssw7fYux/GLm5EITFpYyYiQrdcRsmvbZ7J5TPLIBZ+JHQKaCLvd2JYFYlwoYXFabynm8gf
	h1KMIY52d+J/7s8t3U1RfXPPaSPidOPg6mf5QlYQ7aB8BRAvLf0QvfjU0Ncs5O/S06ug/LAjlnN
	h5ln2+gSDQ3jRXKDE+RPZFB+zRU+TKDaGQhf3H9mSOvL3RnpCxmS2ZpEbLVEP1lwgESF1VeBg5E
	1zpNQwFlIRPEaFd1olPNF
X-Google-Smtp-Source: AGHT+IECEsSQkwfBCZIu4aCVdg/6xbbfhAHy0KA5ITM5kpE6xl3JxGGtEoATFjZl9SBoRxWqA+Li6A==
X-Received: by 2002:a05:6a20:3d89:b0:246:f1:bec3 with SMTP id adf61e73a8af0-25344415094mr362891637.42.1757107423576;
        Fri, 05 Sep 2025 14:23:43 -0700 (PDT)
Received: from localhost ([71.212.208.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7722a4bf561sm23001252b3a.59.2025.09.05.14.23.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 14:23:43 -0700 (PDT)
From: Kevin Hilman <khilman@kernel.org>
To: Andreas Kemnade <andreas@kemnade.info>, Brian Masney <bmasney@redhat.com>
Cc: Tero Kristo <kristo@kernel.org>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Maxime Ripard
 <mripard@kernel.org>, linux-omap@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/7] clk: ti: convert from clk round_rate() to
 determine_rate()
In-Reply-To: <20250814094527.29745592@akair>
References: <20250811-b4-clk-ti-round-rate-v1-0-cc0840594a49@redhat.com>
 <20250814094527.29745592@akair>
Date: Fri, 05 Sep 2025 14:23:42 -0700
Message-ID: <7hseh0a90h.fsf@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Andreas Kemnade <andreas@kemnade.info> writes:

> Am Mon, 11 Aug 2025 08:48:05 -0400
> schrieb Brian Masney <bmasney@redhat.com>:
>
>> The round_rate() clk ops is deprecated in the clk framework in favor
>> of the determine_rate() clk ops. The first two patches in this series
>> drops the round_rate() function since a determine_rate() function is
>> already implemented. The remaining patches convert the drivers using
>> the Coccinelle semantic patch posted below. I did a few minor cosmetic
>> cleanups of the code in a few cases.
>> 
>> I want to call out the changes to the dpll driver since a fair number
>> of changes had to be done outside of Coccinelle. I unfortunately don't
>> have this particular hardware on hand, so I was not able to test it.
>> I broke the changes to this driver up into smaller chunks to make it
>> easier to review.
>> 
> Tested-by: Anddreas Kemnade <andreas@kemnade.info> # OMAP3 GTA04, OMAP4 Panda
>
> No new scary things seen on boot. Can someone check this on AM3, too?

I gave this a basic boot test on am335x-boneblack.  All is well.

Reviewed-by: Kevin Hilman <khilman@baylibre.com>
Tested-by: Kevin Hilman <khilman@baylibre.com>

Kevin
