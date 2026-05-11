Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 648B93BED0C
	for <linux-clk@vger.kernel.org>; Mon, 11 May 2026 09:07:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778490422; cv=pass; b=Gsb6U4qq+7RuChDYgPE4q4hWHkP6xFy+Y7BLrJ7Ave0/WI6eoW6vvc7aJJiUxQIqp3vDMuP7bHJz5ECAeBrjX/KVKqHjxbzdkuzrYi3n5yLK+3VBHy3FN4EQypS63ybTfqBT8K7Rn9PxCnMFj6gmMcHfO+75zgNbGwJt7jaKtf0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778490422; c=relaxed/simple;
	bh=Pzvzl3Msyz3Aq5YqDm/lH/14IGyiBVvDArdLasa5+6U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iT2A17/+zRQS7YuIYGNurWHpCWd7wmxHJ6gDLyVN0NtLCCATioUgTnJpmVTCGmoQn7wx9/Z363/3cbdlJAHd4Gr1icdd44yBjsD0K4h9qjvIY9mnttJJ31g0oNvIzMZD0NKPgM16jX8aB8Z+1Ek2jUZc1MHiszHbRlsMIRNuBNE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thingy.jp; spf=pass smtp.mailfrom=0x0f.com; dkim=pass (1024-bit key) header.d=thingy.jp header.i=@thingy.jp header.b=Qk4IEvwL; arc=pass smtp.client-ip=74.125.82.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thingy.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=thingy.jp header.i=@thingy.jp header.b="Qk4IEvwL"
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-1331e851faaso150852c88.1
        for <linux-clk@vger.kernel.org>; Mon, 11 May 2026 02:07:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778490419; cv=none;
        d=google.com; s=arc-20240605;
        b=W4Ewogcqr+lOhaNrNE4+jnulmebJDzHv5Rfn58eR1L8wEfcqCWdZ9vVB/TujGI3pSe
         Em3x2JTQW7CW5FgdbqzdGsd0DP1eLBBpdnGIXQj6wLe8zXofhgV6YQYqKFbtJ0ko7BwP
         oe/CT3sNOsEF2uyY3agj76KRC5KvgUE/AX94B7QtsWA9gEpK8FMhuvNX1ABNQMn888J5
         jUZYQ38SVUhrhQprXPFJ7ICRTB8UenfbcaHRT2nQnhEdYZuz1fi+C6A5S9sEwa05J7CZ
         TJaY6T8DqvNS2b9xadw2HbsrKJQhKIhXaC/KYOLPflke4vVwO9jQPPvN71jvVZQsNUQ9
         bLuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=fDHouvSKIaohVa9IYx7jzYabikw6L93PsWX5S9TsOgU=;
        fh=LXPrld33T0jIVbHZ5X7T2JHHyBq+ljOc+XriJbQZJbI=;
        b=QQI+YfllWXK+Tg+ob4GNeHOH3T8IFPnCLAYogSQgvsUH6HScxS8/sWY4j+LjMWhxJX
         FZAXnCyhtK0Z9OlM+xD4psvV8OWrO04O/cwTdt0Q1vUAJCjoTfdJ8LSC2GnYj89fGKwZ
         miiW1sayJ8n4cZrzUaOyd6rQv/d790mM+RjSvI6kKscfpg+MI9gYWIuZn85Oq2DkE9nu
         cIgD3oCCHZTLdojqRXeEHcWE+Fs7QOGCUN+6kY2iVBrLz4r3ypaKkBIr3SO99XQYbSz8
         1jNkdvdzpsdxpxq5xWlmP7ooVLyvhd9DF2cGx6yKm3LefdaIm+xgNPjB6lV4sa8vQhUZ
         fCZA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thingy.jp; s=google; t=1778490419; x=1779095219; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fDHouvSKIaohVa9IYx7jzYabikw6L93PsWX5S9TsOgU=;
        b=Qk4IEvwLbn41E2TW66e85/g36b3F5Oic8jWXopVeyPKdoAEbqn9ds0MCzFCDiVaLBl
         9u5AFtThlFUIKp8sUoBU1adnq0CqLUb9Uj9tMzp0kYQJy6Wc3FIlUJ0WcfYrUzEvSkSw
         DnNFjnzw4ZD4L6XWrGeiuhHz0DE768KMRF7xg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778490419; x=1779095219;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fDHouvSKIaohVa9IYx7jzYabikw6L93PsWX5S9TsOgU=;
        b=Us6ei97OBMPB9c+POf4afgCgWXhv6sXny7aNYidBJY+ckjitdgowQK2xV7PQlAvdvs
         o2g3P8mMmFwZXXLGX07/g9/jzqBNv6ZLdPoyokaErqwCk7BG1qHSL5D1fQP4RjPgTcY+
         ZguT+tlK8Ejk29s5Hj146LXSzlO8sIUgXVEqLUhGEEq/YM0qTDteX0k9xBOcmUuqx3mx
         885H+bADTBI4H5cd6sjh05uZkmegLhTt5hhHWaWqmUVwCqjrYf1LNAhASRlonjhYOFq9
         STss0Z1pilJRgy+27CCyRtYzTVwoo6eUhFaiDnql1t2Oma8qKueNc2/qkGYbyfAhqI/c
         E4SQ==
X-Forwarded-Encrypted: i=1; AFNElJ/fur1rLC5jxNE9cKTufpMEslYYA9v3L4MVqH7nxfuzhOyJxxUJejSvYt+W2IAL6+NZTXQFSf/EjfM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwMEMs5of6YHQzfO7bXuvl6wN0m4ersSPv99EGwFqLaQgDZQ2XA
	6n2Iwhwzq41JnyFA+d+x04w+D6te/3DQLrVkN8+N+HZyqDS/CZ/K1ZkZ86/ax3YosjTcnp7xgi+
	MYLSAF9k4Ww0ZE3dBRurI/bvSJ8/QawxrMHsf1pkqiw==
X-Gm-Gg: Acq92OH7r0w1cF//iKfTM9ls87Twv+qVe9krdsHmmyT/xJkT18J8iI2ku1Zav00SejZ
	uJaooHbdtPURW21+g9xNV2hjE9NE2dH5FzVbXavOwbmTJt71K20Sz2jR6C19+1heGFmKEo7toCI
	+Dvw3tkfUo7C+CUEP/FOeVVRWXUPv+fUO0J+sHTfWA/gYubXbBojgoh4qI+tDKZRk085v/NzRPl
	8BtlIa/lG0cV8NoH4+l9YlgLEXnRoxCbrEzdWsFSN7cxwmr9HE0GIIxUGkvkLRAeroYvbfi99Ws
	n2ZbP9843ERgKcxXDU1+1qEyPYWeSWgIq8FzfCpMAKl6HXI9eSs=
X-Received: by 2002:a05:7022:4588:b0:12a:6abf:ab1c with SMTP id
 a92af1059eb24-1323ae990d7mr7795416c88.11.1778490419302; Mon, 11 May 2026
 02:06:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260509104255.15479-1-sozdayvek@gmail.com>
In-Reply-To: <20260509104255.15479-1-sozdayvek@gmail.com>
From: Daniel Palmer <daniel@thingy.jp>
Date: Mon, 11 May 2026 18:06:45 +0900
X-Gm-Features: AVHnY4Ls_cfTwlTD5iPSIxoH1794TMIvrwk8_DVkW9CFVke0q-JxeAZGgVQz9Qo
Message-ID: <CAFr9PX=f7iJ1cHKX_VG9CoNXQCGEXGXVSoLa26tw8CpcvgQj7Q@mail.gmail.com>
Subject: Re: [PATCH] clk: mstar: msc313-mpll: fix one-element shadow array overrun
To: Stepan Ionichev <sozdayvek@gmail.com>
Cc: romain.perier@gmail.com, mturquette@baylibre.com, sboyd@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Stepan,

On Sun, 10 May 2026 at 02:58, Stepan Ionichev <sozdayvek@gmail.com> wrote:
>         mpll->clk_data = devm_kzalloc(dev, struct_size(mpll->clk_data, hws,
> -                       ARRAY_SIZE(output_dividers)), GFP_KERNEL);
> +                       NUMOUTPUTS), GFP_KERNEL);
>         if (!mpll->clk_data)
>                 return -ENOMEM;

It's been a long time since I wrote that stuff but what you have found
looks correct. I think initially the driver only exposed the "output
dividers" outputs and then was adjusted to expose the undivided pll
output and that allocation didn't get updated.

Since the report and the change look correct:

Acked-by: Daniel Palmer <daniel@thingy.jp>

Cheers,

Daniel
