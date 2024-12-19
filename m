Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C34E31E47B6;
	Thu, 19 Dec 2024 12:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734611547; cv=none; b=Vx375wLBxYo6Y9s9L8gX7EVNrMgL1lcCItqK1VW8kJKx2zfc8d1ZixG2osnKVWLbi5utMLY0Gg9JnucCmUiL0lErFsvLs2PtvJXISTUIMYE8+ps2gXgLnTwzO3ELpGDPGHVgZ/jAXHpykdqMISyEtVRGvG3PC8mufoFVCLUvOcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734611547; c=relaxed/simple;
	bh=GOYHpcU/Q+P+r0X77Zz0YHEEb0zxo8YrY+jPBXg1f8w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oA5ETKJoHoIFDRvPErn8CwJyx5LP2FrvPD6BBZ9sHZINypZWICNwLstXKjuqCq7Ca9exVcds8WUvYZb3duSrZfrQkc3wmeofyvFo5LLXKLDBH7jllXgM0c8VKcEeXIOxJ8GyBDHHnD80+pwtNPz2pZIF7WzBXgF0L6wvL9N36zE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pk0oJa8h; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pk0oJa8h"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-2ef28f07dbaso491196a91.2;
        Thu, 19 Dec 2024 04:32:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734611545; x=1735216345; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GOYHpcU/Q+P+r0X77Zz0YHEEb0zxo8YrY+jPBXg1f8w=;
        b=Pk0oJa8hzy+B104MBEk21pnALLBub67j4fnZKPGtK+ztFU5P8B9bOmdgaKx+lrrHGK
         WmBCjUyPHeo4841lfwBdFjW5k2FisL8iNFOGc/8vj59g1gk/eyfvjlHtpU+vjKTjbdVN
         q8lXoApOLgZt1VgaHEHdAE87LRvkxHiPYKeTBEQJIfzmZxS5GPpkPLFPh7M0EBUIOuyj
         I+0w5t7pd5mTRjsZmrSv/hwFGgubgH0NztJW8TTGX/XB+sLNCbHdqJMWFfRSYSxTW9J4
         ZCaer9a1ZxxaPNYUvdGgzLvRlsW+RYf8kbooccwFy+Tf0D4OVUipoav07vZ9u6savbaB
         R0Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734611545; x=1735216345;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GOYHpcU/Q+P+r0X77Zz0YHEEb0zxo8YrY+jPBXg1f8w=;
        b=Q9RsIOeAlJdi6fATwvE8RCIhGt1eAOJAhH4gGp4qAOH1L6mbiE2e5lnhoBg10O3fLA
         ovoIgA3YvnMwwt1JAqKOBT6kqaqc6eZdPCbsXurgllAURPbcFGpw087fG082y/4o85+6
         wuhsVOArfS3CB6CJ3Xf3dzg1z1vRrwTuxRP1E1NGDXlxiAKiBsmt8+v15VOxwzIt4iuN
         midehEL6IBKTiCSAC0PwGJMtEONMvgB5MKbKDEj9KdP3WcsEJIfBBzAOlg78RNW/C/Zx
         Pil9xMZhB8dsRaJRNsNCpEXJ+9WT3jX17x+6cqCIzJVZfIhNtQrTq5mmgaC8RxQ7NBIR
         6Rag==
X-Forwarded-Encrypted: i=1; AJvYcCUYFkgOeN0gJdgQy0upq6zK5QrdDitlfhVyGdcnRJabjv0fYxWm/GJ6DY++UBLYhJqIOccnXQrKCYu01x0H@vger.kernel.org, AJvYcCVEGVWnOt043V0Fp1j58jttZSEUT/uon0NJrEJ9xxLccFj1Z4FRthG5VHmrTre0VTp8EPc9hh4XjGs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyT+UBk5MVmffVYDNZcXddWTH7iORNkFk0jO5BGfoGkv1cRnQff
	/OY4hfKCy7oSCvnMDagTmQqYmxms3w4cbIQBXnYxrTmbgfebyvGtR2TaUmHM0Jj8EBw1Cf7lePX
	uqgaehzu4cjt50uwzZxnQuIbOmErSYWKpaVI=
X-Gm-Gg: ASbGnct3hQ/E6R4+/JujsG1X1SGm34glCOx7kjt6ilXfoOys8iKSkZexcw/SgOywHes
	RbnLEG4spl+lgiqi8BJEAG/7vK+6LOJGc+A==
X-Google-Smtp-Source: AGHT+IHcg5vqSpXfUTUZweqIHL07aifAd1gPNzxvvUmfB8dTWfic5k5beaD1PDMZ/x6BjXB0Dny895x/DQZ0sNv5fOg=
X-Received: by 2002:a17:90b:5148:b0:2ea:3f34:f194 with SMTP id
 98e67ed59e1d1-2f443ce59edmr4668352a91.10.1734611543931; Thu, 19 Dec 2024
 04:32:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241219105447.889CB11FE@mail.steuer-voss.de>
In-Reply-To: <20241219105447.889CB11FE@mail.steuer-voss.de>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Thu, 19 Dec 2024 14:33:40 +0200
Message-ID: <CAEnQRZBpWQ936-yhV2WcxzvTP3m3CNXmopt6YcawzzdZjxh2zw@mail.gmail.com>
Subject: Re: [PATCH] clk: clk-imx8mp-audiomix: fix function signature
To: Nikolaus Voss <nv@vosn.de>
Cc: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Marco Felsch <m.felsch@pengutronix.de>, Frank Li <Frank.Li@nxp.com>, 
	Shengjiu Wang <shengjiu.wang@nxp.com>, linux-clk@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 19, 2024 at 12:55=E2=80=AFPM Nikolaus Voss <nv@vosn.de> wrote:
>
> clk_imx8mp_audiomix_reset_controller_register() in the
> "if !CONFIG_RESET_CONTROLLER" branch had the first
> argument missing. It is an empty function for this branch
> so it wasn't immediately apparent.
>
> Fixes: 6f0e817175c5 ("clk: imx: clk-audiomix: Add reset controller")
> Cc: <stable@vger.kernel.org> # 6.12.x
> Signed-off-by: Nikolaus Voss <nv@vosn.de>

Good catch.

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
