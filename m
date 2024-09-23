Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B15162942A
	for <linux-clk@vger.kernel.org>; Mon, 23 Sep 2024 22:20:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727130021; cv=none; b=srVe/E7i6TEQ93gNFH31B9XXN1FXxt+EtF5tahnFn8hKqncPcyPYPybcLvsi4Uusfhr4bqQRtLAedlkpFO+01b3Z+fpkj7lZ8V+/TndTl932SdutGyQZRWIKXUlDdrl1fPahiofHOD4ifgOZIgn4dfqNCr1pSXaCucdb2kfqGVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727130021; c=relaxed/simple;
	bh=kMUy2Oxv8jJ2tt5vf/Z5fPJ2UkRaSdByoRrEKHNQ4Cc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MOLac+MOIL7SQ2RAEhwDdZK/qkodb2ktsWVpA2CEK/Gt0AE5uLRqSwh5xP105zp+fv2aeE3QfRq78B6YMOicsHoaa77D1s0nkK0Za3W7SIGTa/1jTOjWdFfJ5ki1BIuFW47PtSTYYYBS9ucYW8hqqc0t1cxSEOQdTk9asfYpYso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=Cu0YpkvJ; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="Cu0YpkvJ"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2f75f116d11so47195031fa.1
        for <linux-clk@vger.kernel.org>; Mon, 23 Sep 2024 15:20:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1727130017; x=1727734817; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9S42eFJC2cZLzPSDsM30FylP/sErS75QRhGjAktHewM=;
        b=Cu0YpkvJuPjPhr8EEmn8XtuL232qOKERWA5SPkgRiXy10fgaKug3StxvTI+8pnI8Op
         sUSptthqJdrvGnl/0HrFA3UqFumhK8fnQSoVw9/QvOyfGPA7dYpNTB43FTPKRmEWwXU6
         pHtHOUUXudr4eF4hTspMKyushO+PMU9F8P32A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727130017; x=1727734817;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9S42eFJC2cZLzPSDsM30FylP/sErS75QRhGjAktHewM=;
        b=cX5cWmWyI9KQFye1T0JtxVffUyWVwhE02S+FeDypvS9QSt2QLykNxJmw+C6g351b2i
         W7126x2uxHQa25QFDCh4LsmI9+LvVjsNGFIuI/PfKIXKgkeogWvIYT8o09dRy9miLhAz
         WlqH37YE8uglXmFtWRAKBR4jtpIRsC7rJzDo5y0HC8EV3df9jJF2olaAUlFj0BI0cX6m
         pgVNYgffWqlQTe/aJYml93WJYVhchuP8AcnvNqi7GxhYItDDBxMuYgzNyNxMDSHbxxOT
         sFaxwj9NjU9SAf6vf6iVNUeuOPjzIcnBDSkilQtU4gWvCYaWftwbnQLwO17DmDS5R93T
         E/pQ==
X-Forwarded-Encrypted: i=1; AJvYcCVp7fzPjIDwoys7NzRlcTMqudc+/jmBrc1Fr5H4EBKWOv1nmQEBy76cRhiRRS7bqnEyZaCkUWVvP5w=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3iYT5FMytxe64ESf3ZL7yYBQqInwCgtbxtyj6Bd3hHb+pH5VR
	DKtjF23mfjtvLujT6vujrNvtjkLEjhio3B5ZnfBv1roX10rQlEYL2n77j2PmVQ42puYIn39r4rq
	/T/h6jg==
X-Google-Smtp-Source: AGHT+IFjA4zXkkEVcdrcSPCG603ERg5vTUDpLwZCiG4Tj1Qft9g6an9zKlc4AkZIWPYVRFiy1yZHWQ==
X-Received: by 2002:a2e:b88c:0:b0:2f7:6129:5804 with SMTP id 38308e7fff4ca-2f7cb2f69edmr68241831fa.15.1727130016574;
        Mon, 23 Sep 2024 15:20:16 -0700 (PDT)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com. [209.85.218.42])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c5cf49d80csm95394a12.48.2024.09.23.15.20.15
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Sep 2024 15:20:15 -0700 (PDT)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a7a843bef98so656512766b.2
        for <linux-clk@vger.kernel.org>; Mon, 23 Sep 2024 15:20:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWVbSc2wLEmDvltkPCnysMFXx84EkINm1dnKm/uwlvSb9LB22AwUZf0jXY37me3kX4mcW5pQ0SwceM=@vger.kernel.org
X-Received: by 2002:a17:907:e262:b0:a8a:5ff9:bcd1 with SMTP id
 a640c23a62f3a-a90d4ffda13mr1222335466b.21.1727130014805; Mon, 23 Sep 2024
 15:20:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240923182958.818256-1-sboyd@kernel.org>
In-Reply-To: <20240923182958.818256-1-sboyd@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 23 Sep 2024 15:19:57 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjquWwsrEhcJQ1r3nyp_yDbgptuaG1GSmb0WSa5dcPHdA@mail.gmail.com>
Message-ID: <CAHk-=wjquWwsrEhcJQ1r3nyp_yDbgptuaG1GSmb0WSa5dcPHdA@mail.gmail.com>
Subject: Re: [GIT PULL] clk changes for the merge window
To: Stephen Boyd <sboyd@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 23 Sept 2024 at 11:30, Stephen Boyd <sboyd@kernel.org> wrote:
>
> The following changes since commit 997daa8de64ccbb4dc68d250510893597d485de4:
>
> New Drivers:
>  - Camera, display and GPU clocks on Qualcomm SM4450
>  - Camera clocks on Qualcomm SM8150
>  - Rockchip rk3576 clks
>  - Microchip SAM9X7 clks
>  - Renesas RZ/V2H(P) (R9A09G057) clks

Ok, that's useful information.

But Christ, people:

> Updates:
>  - Mark a bunch of struct freq_tbl const to reduce .data usage
[..]
>  - Drop the Qualcomm SM8150 gcc_cpuss_ahb_clk_src
[..]
>  - Constify some Amlogic structs
[..]

This was 65 lines of unnecessary noise.

The merge message is supposed to be an *overview* of the changes. Not
listing every little change that nobody cares about one by one.

Please edit it down to something reasonable, and something that gives
a useful idea of what is up. And sometimes that is just "lots of
driver cleanups".

IOW, try to distill the *meaningful* parts from the detail noise.

               Linus
