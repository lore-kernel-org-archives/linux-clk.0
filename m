Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 806B91D63D1
	for <linux-clk@vger.kernel.org>; Tue, 10 Feb 2026 12:42:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770727352; cv=none; b=W4LuFmHTt3fKdzCYWGpZYDdcMQbNX22yxvgh+dEOkIoqBnU0praa7TOEvDd6f49GiTWumLksvpg7zuTsx2jN96o7BWFYxEUpRt9Laar/N2ap2kQ7xtrCYzvqXeMBPf24t4ZO1yt/u/WRmabaMxnB1xl0fxjTboGMmbzNGfydET8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770727352; c=relaxed/simple;
	bh=GlKpwAqt8FXcLxnYzpl9cDfIBN0bnkDbFsP/hLk3P+g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t7FKHq6uE0qCOb5u+MZYiM6zJWz0GhwJ9p5cKeqa7ir6+jjQrAtAowc4PgoT7POWEQ6Ck+6aDvm9jP/8UccKYW9XOUOzKXUiUme7zoZkmx14QgGwTUb6RpmBkDBWC3UD/9qWOceKap5+2c1/5edinEXvJL343YXfBGw6ulB4muY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QJxAFGAy; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=IFZWnSsK; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QJxAFGAy";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="IFZWnSsK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1770727350;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WIPR0mr/henT5bqfT/DKonkyulUdL16MgQRnA6kCJNo=;
	b=QJxAFGAyIKmrh2zuPDOEVxHSSsQ+Jf7L+htFf5vMa5tb/Cu2euhDMn8dx+Byo8R8Hudl9M
	BpdK0u2HUQIRXeSHGclPm1/WNzXqAF5OCPAl4MHZCloX5odBLEeYrwFTZ/DjeyfEedxfHK
	MqvZw5fHRmFufbcnVBE5rEz3/axQbn4=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-512-5h2148EKOa6LCojzanbkbQ-1; Tue, 10 Feb 2026 07:42:29 -0500
X-MC-Unique: 5h2148EKOa6LCojzanbkbQ-1
X-Mimecast-MFC-AGG-ID: 5h2148EKOa6LCojzanbkbQ_1770727349
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-896f84e69b6so139700596d6.0
        for <linux-clk@vger.kernel.org>; Tue, 10 Feb 2026 04:42:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1770727349; x=1771332149; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WIPR0mr/henT5bqfT/DKonkyulUdL16MgQRnA6kCJNo=;
        b=IFZWnSsKBQErk8CB8YJCIzGXGKhz4eZMSqPEtLSbj/uwH1A49Xj8LoEJhF6pcy7d2N
         wlrMn9/Sn1Mo4z1rC+00Go3UA6lbA3d6Hv4jolfseNvy6ah3yscypptRH74J9Ncsk6t1
         xD3mQC4Rnp8JTe0NG29vD8wdEU8kt24v6HpCcHydeRNMA6gp8lsgxaOr6upY/soKLji+
         WQtuTUoh3cqzEHwDKL5M2UpPRLACMunCmNF26lRd+oRTofcRF95ITIIln15DqswXvFOc
         rMsxu5C/5vi4M81xOYakJto56DcPPVPy8OmgVfkHCHCdcIFUSLgn67uLW3Z7ftTpq6R+
         6NOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770727349; x=1771332149;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WIPR0mr/henT5bqfT/DKonkyulUdL16MgQRnA6kCJNo=;
        b=uSGLWNIXI1PCch4QazXRNsDhtP5JHz//fjGbpoHf3SmQBwdml8hNxg0KcgVkG5wGgD
         ozLdShQZuIif+L3nqJs4Y8OBbv3Jm8nLC41FlFmb/kN4LXLsCC1Jhwmo6F+kqezRQRN4
         f3V7rK0QXs/nPoxEC0nFIuK4YrWj9EK2huE9EpXYu+z6vQhqHVcvSTiN3IMkg45fPDdz
         IP/beI9OsmfUbh8IN9ESntD0JDvrRsTqf6m+38pX6QN7mZWrb6cAA+TakKQPjn0IDNIJ
         egFIttqvnE3XrZ6Of7v2RQ67KqEgUi2e+5eEzy50XfR6OgPjRMOLBeK0uQswMNDlVV3H
         qcqw==
X-Forwarded-Encrypted: i=1; AJvYcCX3nowe96lSfpWesk8izY4w7valfuwvmrDV2jfL8lIrXLMWJHGuD3PVkc4vWHp++V6sOSIP1QutkFo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyH3QgzzQJwVzu2vITcoe/cw7rjBR7Is2wr5pXuGIWJ+hi5kUNj
	MPkhJ7TCiMBauEaRmbuAakjiHPkqUg5xNqk12M4VhX2Cu0GranS1swxhfEse3j+kRKAvpDw6eBN
	jA7g1ytP0J5JjQcqQiWjbtP7URQINXyRF0VpMFXpqRwWYIogy22svb6MZM59qnw==
X-Gm-Gg: AZuq6aKeKhwDPjrOMxuTOFw+Cs8s+J3s3I40CZQmoB3P+qE4oqV+9LOktxQxKhGXbG0
	haN+D7Zrv2BMHWU3dZWqoU0qmNVhJgrRLhWtpc8Zdvb4wjvv8raeyxYLvsiRfjKEJV3v4oZJ1Yb
	OzNLNbjrlztSkIVSDUU/L77ar18Brn/g96dV3JubJ/mdJ00Suz2CpkMBkhXdLLKdSfO63FJ6470
	jxR5HOzH1LnF4OTR9yc2pRsnmhWoVQTyKUncrq/TIuHgiPZuUv1eqAfOdBT597+9Wj+aFNo7RTZ
	TD1k+3VBYK2Ya8Et2hBPqHjMT8VqBwWk78xLsO2v8Gq3XUX3YbFC0L23DGqADDA+S8oEkDTCRf+
	hoZzs8H8f6KeYX4tlJNIpBhBWeF20U/hwENYv/iEGOvthhfC2DWGILUU3
X-Received: by 2002:a0c:f952:0:b0:895:4cc2:8bfe with SMTP id 6a1803df08f44-8954cc28dc4mr97314006d6.48.1770727348927;
        Tue, 10 Feb 2026 04:42:28 -0800 (PST)
X-Received: by 2002:a0c:f952:0:b0:895:4cc2:8bfe with SMTP id 6a1803df08f44-8954cc28dc4mr97313856d6.48.1770727348578;
        Tue, 10 Feb 2026 04:42:28 -0800 (PST)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8953c0599b4sm99582176d6.41.2026.02.10.04.42.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 04:42:27 -0800 (PST)
Date: Tue, 10 Feb 2026 07:42:25 -0500
From: Brian Masney <bmasney@redhat.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
	Thomas Gleixner <tglx@linutronix.de>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Ulf Hansson <ulf.hansson@linaro.org>, linux-mmc@vger.kernel.org,
	Linus Walleij <linusw@kernel.org>, linux-gpio@vger.kernel.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-rtc@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>, linux-serial@vger.kernel.org,
	Guenter Roeck <linux@roeck-us.net>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	linux-watchdog@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: Re: [PATCH v2 00/16] MIPS: move pic32.h header file from asm to
 platform_data
Message-ID: <aYsnsecPa8bWMbaA@redhat.com>
References: <20260112-mips-pic32-header-move-v2-0-927d516b1ff9@redhat.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260112-mips-pic32-header-move-v2-0-927d516b1ff9@redhat.com>
User-Agent: Mutt/2.2.14 (2025-02-20)

Hi Thomas,

On Mon, Jan 12, 2026 at 05:47:54PM -0500, Brian Masney wrote:
> There are currently some pic32 MIPS drivers that are in tree, and are
> only configured to be compiled on the MIPS pic32 platform. There's a
> risk of breaking some of these drivers when migrating drivers away from
> legacy APIs. It happened to me with a pic32 clk driver.
> 
> Let's go ahead and move the pic32.h from the asm to the platform_data
> include directory in the tree. This will make it easier, and cleaner to
> enable COMPILE_TEST for some of these pic32 drivers. To do this requires
> updating some includes, which I do at the beginning of this series.
> 
> This series was compile tested on a centos-stream-10 arm64 host in two
> different configurations:
> 
> - native arm64 build with COMPILE_TEST (via make allmodconfig)
> - MIPS cross compile on arm64 with:
>       ARCH=mips CROSS_COMPILE=mips64-linux-gnu- make pic32mzda_defconfig
> 
> Note that there is a separate MIPS compile error in linux-next, and I
> reported it at https://lore.kernel.org/all/aWVs2gVB418WiMVa@redhat.com/
> 
> I included a patch at the end that shows enabling COMPILE_TEST for a
> pic32 clk driver.
> 
> Merge Strategy
> ==============
> - Patches 1-15 can go through the MIPS tree.
> - Patch 16 I can repost to Claudiu after patches 1-15 are in Linus's
>   tree after the next merge window. There is a separate patch set that
>   fixes a compiler error I unintentionally introduced via the clk tree.
>   https://lore.kernel.org/linux-clk/CABx5tq+eOocJ41X-GSgkGy6S+s+Am1yCS099wqP695NtwALTmg@mail.gmail.com/T/

Sorry about the duplicate message. I just wanted to reply to the series
with MIPS in the header so this message isn't lost.

Can you back out these two patches from your tree in linux-next, and not
send these to Linus?

clk: microchip: core: allow driver to be compiled with COMPILE_TEST
https://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git/commit/?id=026d70dcfe5de1543bb8edb8e50d22dc16863e6b

clk: microchip: fix typo in reference to a config option
https://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git/commit/?id=a6ab150deb4b740334721d18e02ad400a9d888f5

See
https://lore.kernel.org/oe-kbuild-all/202602100954.BAVYq6aC-lkp@intel.com/

All of the other patches with the include changes are good. I have
patches queued to send out in two weeks to other subsystems once the
include changes land in Linus's tree.

Thanks,

Brian

