Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9BB33A1E72
	for <linux-clk@vger.kernel.org>; Tue, 23 Dec 2025 03:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766459971; cv=none; b=DwPD3UjdFuDIlQ7s2w0+Bx+shwQ5Pafiqn+bC02HED+R/+IBp9kqwRxAC9wImHKBrSlIaXPZVOSPNeoh0EVcaqQute18cl002Vp/drE2pGXd/iAAkjxKimr5uWYwlzQFvY/RNoncq+0DSyjGjmoEL23eLVrurNapyDYAdkRtkQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766459971; c=relaxed/simple;
	bh=pd2hd9AEX+WskWeDqJXxKCyLLtKBcx0KAJIPRnzr5Xo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i3JoJzrJdS/ikqIMw0XmToob7feRNJYLCPfuMIhi6tcv6nLjC78wnABCHsv6uZ5SwGtFQdZnM0sDquY7v218OrzYwT+5SsEs4SUeroPkwGzw7RkVGojaIo23b+XJ53VQtSXfZYDmlR5EMJLJa+Ji2RUnMb6x1Gs0g5wBf49YvB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=a5anE8Nr; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="a5anE8Nr"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-594285c6509so4980075e87.0
        for <linux-clk@vger.kernel.org>; Mon, 22 Dec 2025 19:19:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1766459968; x=1767064768; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pd2hd9AEX+WskWeDqJXxKCyLLtKBcx0KAJIPRnzr5Xo=;
        b=a5anE8NrNwAIvUHatTvZViGDlRJ7CZnQmgPWZhhVkFLY74lOD8m/XUhp3DFxw8Q3oo
         mW0Jxofd1T6KaoHglp2CqHxM+7LcWfEt/YUXGkOsYnjxOqpqgWwjMjvTMs3Ll51jLfNA
         VXjMyPCjGXsRTzzjJHGPvtjVluFTocfaTJbxk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766459968; x=1767064768;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pd2hd9AEX+WskWeDqJXxKCyLLtKBcx0KAJIPRnzr5Xo=;
        b=a6c04uJr59CLUjnD0hgqUBCoqcbHEerJpEmo70BEf/DUxH6uhdd+Hwivvf+k4VXSts
         RdsUEvDm5veG+Wk88NT00wLbJYX3onBAMlahjWW5CyN9tAUfUh6yeIFrYGuXuUR9kSOa
         Qqfnn7hjHDqimb2J9W6/3K6McjtxswR2E93SKr0tAIjN+9Zuj262EguRgbwCWNLjwXH6
         Qv5oVGklg90ZTopX9u8AnYQt+93q9gmMKVi9ti4rM0exLBkvfIye/17iUv9iJ6a6oeio
         GTBDZa3afpQKMNvM5zzD0jKbH30BKTuFuivcXjI64GE23oRchFHnWGkXHLybFXqBXUII
         0vdw==
X-Forwarded-Encrypted: i=1; AJvYcCW0ZOAe/7qudZZDFMsIau3SjticsqVV8wK6GkQVg3yXTL8lAHOassjM/ACQWYDyFVJP7gj/HFLIUzA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyX0h3rlJg0LtVULXXpGQ2lQo1Z0q/am2tpIc+Dv7G4bl/PfIuI
	rsYE0zY6TFD3q/xbCWw99vqHyVwrPxnSk/tDQDXpYJ3sjrTchybGVaqeW+xy6K1idY0THiW8LRj
	Ly8frF6iXGFywP59bTpVpNn4L1JRHAUjfk7qUehfV
X-Gm-Gg: AY/fxX4f2y077V2zsLyizBFmY++OIt6Yb36hEWM1fxJ1NYXENRMgdtYtHYJ0iz1tBEt
	RD+IV94lFsZsLwCjSiiSgqTrRwWi5g+w5dvsRd+A9+Tbd4ZjfnW1Zu9Yj3fx6UvxGcPkcehjU+S
	8sGdyTSvyC49TIpRXutwvZFwtIk5Yrl9kQ6YW5FL3lj7T64NVgKNIINH+j9/rrM+8UT/g15US1t
	xGKP1RgkYM7OoePcCc7bO50ooJPbhSMubLal/DRhxf8IlfRqljsnJv2EnjwF16d6R10Y2yr5g==
X-Google-Smtp-Source: AGHT+IFy9AOL0XZAW314iBU7PN1wAQk22EnHMu31kd1tAVh11JfXOyXoRocWK3NJXq6iWOnv76XMMgmNoj26Q+851TM=
X-Received: by 2002:a05:6512:4011:b0:592:f72f:c1d8 with SMTP id
 2adb3069b0e04-59a17d0ceffmr4689655e87.16.1766459967809; Mon, 22 Dec 2025
 19:19:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251222150235.34919-1-bartosz.golaszewski@oss.qualcomm.com>
In-Reply-To: <20251222150235.34919-1-bartosz.golaszewski@oss.qualcomm.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 23 Dec 2025 11:19:16 +0800
X-Gm-Features: AQt7F2oIhxgGHerdzbiWe8ZSd5-OTgGfh7cSzAPDbvOiCtJ4ezQNimNvcoit_0Q
Message-ID: <CAGXv+5Gpf+U8ih_QvZmEwSQgkb2c0wesLNePCG=eDqy0G7F-vA@mail.gmail.com>
Subject: Re: [PATCH] clk: mediatek: don't select clk-mt8192 for all ARM64 builds
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 22, 2025 at 11:02=E2=80=AFPM Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:
>
> This option defaults to y for ARCH64 meaning it's built even if we don't
> want anything related to mediatek. Make the default condition stricter
> and only build it if ARCH_MEDIATEK is selected.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
