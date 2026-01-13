Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33442284662
	for <linux-clk@vger.kernel.org>; Tue, 13 Jan 2026 15:49:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768319382; cv=none; b=iWS9c28I+Rg7ZwkFk4UHRRX1i1bz3Wwbf67VawcglDHV6Wl8SaaQn8c0icP4y5fpbs831CJGnrhhEJ4Gzy4wkMAXvel1ux0x/QUmXuoPR4GU/0RKJHehHyAIv/uhvY/wVqUa93RPrTAZCqF/x3iBWUFuhhadcAZ9AKWQftIYah8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768319382; c=relaxed/simple;
	bh=KwDBqmE8DzZnhS9XuHRGHXbq3OKd36PRfwkAUcwYLh4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LoYSWIfmOxqUpnUJZFAeZLC1GQYIxszxKqMxnI8iuLbtgn/IerHRJiz77SB3aogxLViIdPn730RhK4CHU2WUesgREln53z5RbisYSMV0NZsp0LaKtp8ZUnlewZvvX9CuGgmfvO1mZVCedVPvK0rj9B2KBew7ZXcd7Gso+eB+fSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QnfuHd9Q; arc=none smtp.client-ip=74.125.82.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QnfuHd9Q"
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-11beb0a7bd6so4794120c88.1
        for <linux-clk@vger.kernel.org>; Tue, 13 Jan 2026 07:49:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768319380; x=1768924180; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KwDBqmE8DzZnhS9XuHRGHXbq3OKd36PRfwkAUcwYLh4=;
        b=QnfuHd9QTEhusUPQrSYDnuQtw6n3GpLvfOkt3JOaJ2AGj6fOIrK8L/oduwSOA6QGI7
         VWQb/iOLsDv8+8UEFeY0PjksvAMruLc+VbCzDGrT7YRZkoKdXsVD1/GwsyC8PnUrZ+VH
         2yhganbpz+oGm//lKShA2aFx69MrTeL/eNVzD4wwCU/Nj25EUlp6brAJJJh2dt26n/81
         1qafxP22v+Gg/RXpRJyqaQpsdD2tJ8zJvm+9AjJ9icZKH8Y5zZbLmcdx5cIWMHz7ihzH
         AR98E3A2nd7/Bi2lxs0KHeivyZtzM0rFtPiOeC4Y/OO1wTl47YqRRfe4d5ymqIlqYWZA
         Kmug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768319380; x=1768924180;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KwDBqmE8DzZnhS9XuHRGHXbq3OKd36PRfwkAUcwYLh4=;
        b=Y1Vc28VkigNaHG+ok/NkSGM3KZbuX3/dA+Wxk/ice9uOAISuSncTkt+mNHFmk6W5Rq
         DHgv4toh7WMQLea2lQg2CNXvjgaOP1sFm7iEEjYaYuA1XCXtOovYeTvUWX10Hz0L/Snx
         erpiW2fw6tcFcTHdo1x86DgGBZrQARvjBK0vy5GCimXwje7qB4pug3RFjEgxf15S8pKu
         FiA90n8M9E3yOQXd5sACFYGnO2XwH7BRkuX2PSZ0H4Odn1Vf1Otrwx3m9sg+bGRMismW
         3KfgCKQ++AFEofWeIkpsfjhAqIZdiNHKXapKom7XqfU96nR7XOQw0YeyMxJ54GjfZsFM
         E83Q==
X-Forwarded-Encrypted: i=1; AJvYcCWyUDd5t6LviT1Dcuq323LpQnQFyQUHg+24q7qEu85ky/HAj3gf8ZMyRZf7mEssRpsq6/sghFrVzFo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx38koRNvJUsg7z4LzkSz8036B+Sp+9cfaThaSPHm3DRXJylXuV
	rBCE94ZTVoIp8QnAN2XhtKFbkHqSn5ka8YEh1kAxkB1GIOPlJL5RCr1PvxNrdLeXaP9Goao8oM3
	8P+Wzhim7Qz5kPqZEqd4BXi0Q2niOsG3UHvnBsSs=
X-Gm-Gg: AY/fxX6OKHrykFXxknLeEAYk1b4FJo3mP98X0XYv79YvaBGYtpOMMewOODbeT/rFQMx
	OGK5xPyylTYwDVc0+bLvxhxaoFcq7CSKx2L5z2V4SxzndakQ3yjw72cinguwKaMD9qArVXZQ3Il
	saVrNnl8L5UgLr43SMTPGnQiuYlVUalERAETZrt76qu/R623+wzcIJK+o2G/4wEbccpGqdRQMOd
	NP5CKWrKWgnHzlp4xcuyUCURXekBu3prTIR+k+D7+FNn72AH2J/qaUOqN7XHqcasXqaAGoJgwAY
	Lu9+d5XjtUgY7W/t7r/fTXDBA1kmaFNj/E3vAXsiG300G3sgDO9W6zLe7fka8CxyTtO71VOmASU
	qTMczs+txvw==
X-Google-Smtp-Source: AGHT+IGjwuR69qA8lHJxE6iN497KsDTMWZ2U3kZzgncmWwfux7F5qK7HWUrvnZrqKDNyxZj/FyGWFvfT5x9jkoebLmw=
X-Received: by 2002:a05:7022:f111:b0:123:2d00:c074 with SMTP id
 a92af1059eb24-1232d00c1b4mr2953367c88.25.1768319380033; Tue, 13 Jan 2026
 07:49:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260113-v6-18-topic-clk-fracn-gppll-v3-0-45da70f43c98@pengutronix.de>
 <20260113-v6-18-topic-clk-fracn-gppll-v3-2-45da70f43c98@pengutronix.de>
In-Reply-To: <20260113-v6-18-topic-clk-fracn-gppll-v3-2-45da70f43c98@pengutronix.de>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Tue, 13 Jan 2026 17:52:06 +0200
X-Gm-Features: AZwV_Qio2Twao-YGROiITtozUb3Ksp-2XNSe0asye7QZjZsW6UFB1JKtigNETmM
Message-ID: <CAEnQRZAUw8cVb8N4tvVP6scs2dTedRra653WPvpKOWanQ0gNGw@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] clk: imx: fracn-gppll: Add 241.90 MHz Support
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, linux-clk@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 13, 2026 at 4:53=E2=80=AFPM Marco Felsch <m.felsch@pengutronix.=
de> wrote:
>
> Some parallel panels have a pixelclk of 24.19 MHz. Add support for
> 241.90 MHz so a by 10 divider can be used to derive the exact pixelclk.
>
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>

Acked-by: Daniel Baluta <daniel.baluta@nxp.com>
