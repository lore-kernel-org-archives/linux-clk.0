Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AF21392C30
	for <linux-clk@vger.kernel.org>; Tue,  3 Feb 2026 07:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770105125; cv=none; b=ClHQUD+/DTbyCg8vrf+FMBjIx8U9xypLyIsrr+F+/JRM1TQCWy48qxAcTHV41XxEuCTnenlP9rNaL9dFsMyiqWyBSgZWQVc2nwgqREB0Gw67aUwWowi373+mOLEJlzmSW1IttAEsZqZP2PResfz/niZ6IxE2fFjOKsWieqoiYsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770105125; c=relaxed/simple;
	bh=x/AymD6yP+kMWeFlxau0hockTzy+vCMvN+rbNOtcwOQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Gkhr7tJudqSXqdhaErz1DRGqoRNSUmXLEWHpJsTaP0z3I7tjJqouKicmjskxxPR5O/DznlEjua8VRIeEGBxVU11Ow0JMXJwZftgDvaI5bDyXwNareQHIJOdk1o2VQowuiKac1ps64YqO7JjApq2wFnJWViiBUQfzZYVbPsiyT9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=DvJ3CbI1; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="DvJ3CbI1"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-47ee937ecf2so4330135e9.0
        for <linux-clk@vger.kernel.org>; Mon, 02 Feb 2026 23:52:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1770105122; x=1770709922; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Il7iVNvRu3rqGF6RHccurQ2AILn09NYqOyNFzbpCW+g=;
        b=DvJ3CbI1LVRxr5GTaF7SQNQXV8QwLYpcE/wTDBtA57PmTXj45jncy7A0QQElPeSgi5
         jsH6KUTtum6QrPteD7/VDoY2xcq+RXmAWkgH9npKTU1++btXYNeCUZxQOHXaLL8mjdX8
         2lUVwSMKU4qSHi39V4c0bCK8NeurBERcYdyW7ukeHfdhFxnl8NC+hHnBiALOYxZDTfJt
         47VoROQ61jGbBtD76XXg46q8Wv/EiGgUvtO3p+paw/2CPmk/3byLW30L2IIoWVmVKz5t
         R+EkSUKWFTCuIKpJ7lEQwLCFWoo10F65MReY5lRdNmzuWiEVn1KWKBTd678oBay5VqwG
         zuYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770105122; x=1770709922;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Il7iVNvRu3rqGF6RHccurQ2AILn09NYqOyNFzbpCW+g=;
        b=QZ68U72b7vNUQOZos7tZJph25fj4oq/hM+cyDoJJUWHkS1RnE9mPZRtqk5IhyctCPJ
         NzGziUL3qcQ9QY4tXf6jv3BxAnBrPfi2ebYyGrGS56z1FmXl3i6i3hGupgLjM84lwDwj
         khiOhNTW//fnFyzTceDEzqRy8cUFfYTNO78bLE1htH+b6oOoMhEpVzZcds6LOrllF5mc
         rEKPfUEhWrHQlmDPlnUt697c8Y2MoGCGOHtkg5EmAsNRGGeYk3gPLIgEADQCd3LL1Y/f
         tKmzUyus+WG9mPvF8j8s0Rvj98hHzkH2IjnEnI5Pz94Zy+K3VAJELh49Q6FqE+lSblJi
         EGFA==
X-Forwarded-Encrypted: i=1; AJvYcCUWW9XZcmvUh2XlYihNq40ytdmk1+Yc5Ly9J6tl14typkQBCeaeUwafxo0iZZOX8uUMEbZIxJIXruM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw52b8ZzGgHMwDiTx5Eo858u0fpzigkTqsuhI8aHzFrsXqNPMr5
	9i6vjrdwWuif9jW5DWLta607NE+ae6aOeFq6owGnDPkw0g4+UelluU9CFbWanDEJ43M=
X-Gm-Gg: AZuq6aJuU6HdMxD5TaMyidFe+lprFh/9RSizh01+6WS3d9CYPLkZQrJA3VeYzvpiLan
	iTzyca+VBelKrU0tl4zOB3Um0jK1b46mPa7JEM/fpt2m8CDDnXfkQ61CLUj+a92SKVDi/jJAV4p
	POmoBLyfh7cTV2oH0E5Jv4UP63nIihLKvZlTNM5w4GXcPJ15ch/ULuxH+XjTXoT6dPP9ICMaOfN
	knMZS5nOWKL4kJddn1vU10DN1Qt3gthbNevxQySY0G+M8lhYThVhFa0Na9CKTckw1aUPIOmpmPm
	V+Z/zgKSeNohv1rVmlc0oifF7Ar5rP6HjN4Cfa3aUqyoG5Y9NOT2oZUcInKaWZOyvGO+C+ThwSf
	LfDsU+T67c4AIEij0JXtO0NwoqA0aaymLYH+qBSXWYTJdofnAlcIBZO0i/X/4B7e30y6PP74MAi
	LI46hwrEcHtBDqkjzQ3iTkQz7Ue5k7Pw==
X-Received: by 2002:a05:600c:6303:b0:47e:e59c:67c5 with SMTP id 5b1f17b1804b1-4830513aed8mr35004115e9.8.1770105122137;
        Mon, 02 Feb 2026 23:52:02 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.215])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e131cfd4sm47557261f8f.25.2026.02.02.23.52.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Feb 2026 23:52:01 -0800 (PST)
Message-ID: <10fc5513-9808-4dba-bf9d-f25a284d32ef@tuxon.dev>
Date: Tue, 3 Feb 2026 09:52:00 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [GIT PULL] Microchip clock updates for v6.20
To: sboyd@kernel.org, mturquette@baylibre.com, linux-clk@vger.kernel.org
Cc: nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
 conor.dooley@microchip.com
References: <20260124094715.2106796-1-claudiu.beznea@tuxon.dev>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20260124094715.2106796-1-claudiu.beznea@tuxon.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi, Stephen,

On 1/24/26 11:47, Claudiu Beznea wrote:
> The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:
> 
>    Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)
> 
> are available in the Git repository at:
> 
>    https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/clk-microchip-6.20
> 
> for you to fetch changes up to ec8c1f35b5aa7aa63bd398add63a8633adad532c:
> 
>    dt-bindings: clock: mpfs-clkcfg: Add pic64gx compatibility (2026-01-16 08:48:38 +0200)
> 
> ----------------------------------------------------------------
> Microchip clock updates for v6.20
> 
> This update includes:
> - clean up microchip/clk-core.c to:
> -- fix a sparse warning related to multiple initializations of
>     pic32_sclk_ops.determine_rate()
> -- correct the return values of roclk_get_parent() and sclk_get_parent()
> -- drop an unused include header
> - adjust the PolarFire driver Kconfig section as the driver is now used by
>    non-PolarFire devices
> - update the documentation for the Microchip PIC64GX SoC clock controller
> 
> ----------------------------------------------------------------
> Brian Masney (3):
>        clk: microchip: core: remove duplicate determine_rate on pic32_sclk_ops
>        clk: microchip: core: correct return value on *_get_parent()
>        clk: microchip: core: remove unused include asm/traps.h


Just got informed yesterday from linux-next that this commit ^ conflicts with

   07caa83edd9a9 ("clk: microchip: core: update include to use pic32.h from 
platform_data")

from the mips tree.

The conflict should be fixed as follows:

diff --cc drivers/clk/microchip/clk-core.c
index f467d7bc28c87,ce3a24e061d14..0000000000000
--- a/drivers/clk/microchip/clk-core.c
+++ b/drivers/clk/microchip/clk-core.c
@@@ -9,7 -9,8 +9,7 @@@
   #include <linux/interrupt.h>
   #include <linux/io.h>
   #include <linux/iopoll.h>
- #include <asm/mach-pic32/pic32.h>
+ #include <linux/platform_data/pic32.h>
  -#include <asm/traps.h>

   #include "clk-core.h"

Thank you for your understanding and sorry for any inconvenience.

Claudiu
