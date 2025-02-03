Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B67120AF74
	for <linux-clk@vger.kernel.org>; Mon,  3 Feb 2025 16:27:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738600077; cv=none; b=MhAt+HCLokUfsiImRpAhR6Iao7rOe6qQ8LUnzh8YtyeaOSEkR8Fga8yV8F9u3KT9PeyhLh7/BAAPMkSPIUgxcQ74K5gkTuxF0IRS0BR5lyTqS2B6BIL3P/8nidPSKDhs3EdO/p5lYIODcRKFv4aH0Ec95Z+DVUVw4tnL+XmS6d8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738600077; c=relaxed/simple;
	bh=rYWmXaYScpoaMc2618PKbrqUETuGturSXQt5VcAoO8I=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=CYvQ1wzMGPBbHFEbhL9JtWMhMZeOJmrLpTCxlXFoqgMg4C3WWAH62RqkZoatnEnjTV3+gz0yzgLHANx/G6R65O8zT+6Ro1oDXcmJi4LdrMMaWI9Y5jQFLFxtOFoD7tkurwsVarv1iB7OB2CUz0wrqDF+68C7FTq5CX/ETvZORHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alefors.se; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.160.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alefors.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-2a3bf796cccso2019922fac.1
        for <linux-clk@vger.kernel.org>; Mon, 03 Feb 2025 08:27:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738600073; x=1739204873;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rYWmXaYScpoaMc2618PKbrqUETuGturSXQt5VcAoO8I=;
        b=CLusofWXbLfiI6DP/RAIEIDX5SX0ruzNwmCOSv2fFS4SR0qMRpAuEC3L0jzmrbqL9Z
         ByDB6to7cGgHvy1QLzG6QPe9g8SPuFcG/fddMLzDlAOjJnwoVXlVPkjios0+v2hPPT7o
         dDX0bT4oypV7XVYYNc02kWUwDerfmqMlGdlEX8z2g34T4MbrNdxJh6P3EXWM/WTwHcfU
         t9e86s+EygEszGjByVT5ZxFYovc4SS0/V1tX2aXKgZ7uvQXss3Yt2aEq6dK71RC9KL4l
         tFzqKc/GmKYxJpOCWafCcSGvuI+IUdRL+AIaXUAKP1RX9k1ohyUB8v3oCY2+ZcNIXtpH
         Qfeg==
X-Gm-Message-State: AOJu0Yz+OmzKvIULaVcRDkPauo6dL5CkDR8JniUGx3PtWW8jWhW/2mUE
	rNG90nCbgFIskfoSv0YBL49PFV2pU5FonvjiAI+XG8+ZfcWaiB3cstypihz1cyuiCJ7EUANsSnF
	23xF76glZPGX3aW8uSYs+LdKxnBP9DK0j
X-Gm-Gg: ASbGncvg5pxQQQHmYa8oRlgtyH4NDVcYHTfjjFJ3xLNQwyF0Ws3eZubxEpboqFShbMq
	pa54I5QPrCognZiSbSzw1hGSbZ8oaMg94EdIFK0Lvvf9CkKQwtl+PeiEPqdA0dJsl56xJdg==
X-Google-Smtp-Source: AGHT+IFf+8faAkzcYS1IQQ/NsR2vVI77o5rrC+/ukT07VzZHrjOBkYTvZEYUiQw2b2xepbzcuA3ech1+T5m8Dsgapis=
X-Received: by 2002:a05:6870:7985:b0:29f:df27:8b80 with SMTP id
 586e51a60fabf-2b32f261909mr12470341fac.24.1738600072712; Mon, 03 Feb 2025
 08:27:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: =?UTF-8?Q?Magnus_H=C3=B6rlin?= <magnus@alefors.se>
Date: Mon, 3 Feb 2025 17:27:42 +0100
X-Gm-Features: AWEUYZmMZDbKoxoFDS70Ev91cTPNxTL84eVQ1wFy58vILXoVpuPOcVaW7x7LQO8
Message-ID: <CAB6pCHSesbBLVAVaLgGKo8yhe6P6HxPcAFjKxrV589dVKjcRow@mail.gmail.com>
Subject: Re: [PATCH v9 00/23] Support spread spectrum clocking for i.MX8M PLLs
To: linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi, I would like to assist in testing these patches but have failed to
do so so far. I applied the 23 patches to my vanilla 6.12.12 kernel
that runs just fine on my custom imx8mp board but with them it doesn't
boot at all. Uart console is dead efter the standard u-boot "Starting
kernel ...". Nothing on the display, leds or usb that normally are
alive. Do I need to modify anything in the device-tree for this
patchset to work or what can be the problem here? Any help is very
much appreciated.
/Magnus
