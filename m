Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F43F32D0EC
	for <linux-clk@vger.kernel.org>; Fri, 31 Oct 2025 09:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761901490; cv=none; b=C3uHSAljPJdoHjAnhd3+HVf9X0nXZepQLgBZqi9oRLLPa+JTY2hCYyVh4Q1a4+Eb5LQcLA0AOjvXIz9ic9dCs9xBYwdUDbjvchC+plzkC4cZkfqdPmEYKvUY7roPsMO4j0wppJjqsQPHC9JG5uiwNi/Di2FCBDE0n7DcpHG4aA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761901490; c=relaxed/simple;
	bh=78mpbY+1AP+HcV47YAi+QuuK2I2YpptrD3Iqg/3Y8ww=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=KfVIQwEe7pQtfMz5UBJK8r07xp1sgEg5ntUv9tcMlTz+uehuen0PCAE1TwvomLLpjTmSxVzD0I/UM5LNM+WBbJdmDjRbjPgSgjW9hHmBuRky904JpYmnClNQxF85LvM//LTg0NYYeYB07YB7sfVb8GAR0vWzE3U/YrAmrN4ep78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=Qpak3mQ6; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="Qpak3mQ6"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-4270491e9easo1723176f8f.2
        for <linux-clk@vger.kernel.org>; Fri, 31 Oct 2025 02:04:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1761901485; x=1762506285; darn=vger.kernel.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NTUxY2QRsBa4YiD8QVHQP1f7QsWrz+ePLEmHRSCQsCg=;
        b=Qpak3mQ6IWqd+s4a689VSD+ti3WuketECUJbwclwfDnmrmriCq7yWejaN7IRyu1rxp
         adYTCXF5xHjpfM/d0RXvEex9T/W+i9SqbbldHXTtSR/en/C/Qe6pLTF+UsX6zj1NVNbf
         6SKIvBT3u4Kh9gw7PoDUZkpNVoSmu2UWVGio2T/6EidEW8uqlHRaKVzQFBZPT6rn0EXQ
         U/x0w7gYqaEAvGn9AWmZFaYD0gb8mlqpgSeRaUPUchOu0zQAUbdyH8FXvmV84OhyL4U5
         j6sNlPheK5UGW5gc//1mq4LwkhzDApNvH34vOobtClkoaGO0Qkbe416tyNij3MWmofzJ
         4NPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761901485; x=1762506285;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NTUxY2QRsBa4YiD8QVHQP1f7QsWrz+ePLEmHRSCQsCg=;
        b=M0Fropy5c2/Xjb083tSs1Zr/L82VUHOFk2iSTfyoJ7GG6nphhAGuA9eUg1UwnDHh/S
         V7zqDRRA1nBqYe3OSXcW2W17qbnwDTHZb4Ieyx/RW1aVkSvFQJG1MFgNTrLIULzQxovR
         /sR/74F4s6fw+ULlKKyQZWmmVVe42PfH2tSf+eWmzEADaU4RAPN0mLUuxpz1Kt5qrir/
         DFnnOocBp6lwuP3nIljGQ5Vbo7O0i/vg/s8eYyaGbWXGQWpN5x/7AFfqOQ8p64Yi/6cq
         xa7OQ2sLlhvfzews3c/7xL1P9YrNVe5BX2cBEuNJL2MVHUcvfo2Uis4YX3vKqnhXyxrh
         pxjg==
X-Forwarded-Encrypted: i=1; AJvYcCX3IP/pQZPuRpi9mjiQbR1xRXviCBUwFLJqXdSvAZavZlecq5/3VY76GJvonMNtWxFD+T9K2IS1OLk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyh5oJzQPABVPDdxTqrdOrIpBYJc5sEYuk+PkeVbnGNvPfLREk4
	IMTRp3J8TG23+EZexwqdaZ72+dbaIdbLSdx4f4JJtBl5cshZ7UoSKFtlB5rPuCIhwIw=
X-Gm-Gg: ASbGnct13hFUoVDi3o7Tx4tHXTUrSgCeFbWVu+KMQ3YO7yChOlPrc57l72FNjTqBtBw
	OmVjCSaqybovu8U9Vt5Wv295+9xOizbCedTYtp9LsgkmlIkMJTQfBVGwB7j4MuAl9i9T/+/+lUq
	7Vfmqn0eTadg+oDP6WS6KEpWQ/X8JmPUuq8AYfsOEBVoJ3MpbbG+NfwvE0OLVgHH+rAOwsOQL4V
	stuEeyG7CQwyk1nQghx5m0tI49PvC/dUic1bHyeX2Ga0y0DzDjqoDx9tIluZ9/EbK5Lf4gtpgqd
	Mb7lvO6GQ/DTgHfQMdvhTRfQlfNoKs3FWLK5sTVF52Y2vX5YPZ3We24EPoTf6u3u+6gy0JTTrmX
	rNpLfgR9aO3G4bydcV1R/KgExM0rT8vscAHN58N2Zv54MQ0zJ+9LIG5PgHGacA3GUglv2NgYnHo
	M=
X-Google-Smtp-Source: AGHT+IHz9Ep06R4/artcngFbJlB1bKA2Girkc8hxPw+EQjUGEBiqGYPMJZdtFD7tESCBa2KyIazeYQ==
X-Received: by 2002:a5d:5846:0:b0:428:4004:8241 with SMTP id ffacd0b85a97d-429bd6aa277mr2136641f8f.40.1761901483472;
        Fri, 31 Oct 2025 02:04:43 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:b8e9:e124:10fc:8444])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-429c13e1d47sm2392315f8f.23.2025.10.31.02.04.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Oct 2025 02:04:42 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,  Michael Turquette
 <mturquette@baylibre.com>,  Stephen Boyd <sboyd@kernel.org>,  Kevin Hilman
 <khilman@baylibre.com>,  Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  chuan.liu@amlogic.com,
  linux-amlogic@lists.infradead.org,  linux-clk@vger.kernel.org,
  linux-arm-kernel@lists.infradead.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/4] clk: amlogic: optimize the PLL driver
In-Reply-To: <20251031-optimize_pll_driver-v3-0-92f3b2f36a83@amlogic.com>
	(Chuan Liu via's message of "Fri, 31 Oct 2025 16:10:07 +0800")
References: <20251031-optimize_pll_driver-v3-0-92f3b2f36a83@amlogic.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Fri, 31 Oct 2025 10:04:42 +0100
Message-ID: <1jms57xx05.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Fri 31 Oct 2025 at 16:10, Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org> wrote:

> This patch series consists of four topics involving the amlogic PLL
> driver:
> - Fix out-of-range PLL frequency setting.
> - Improve the issue of PLL lock failures.
> - Add handling for PLL lock failure.
> - Optimize PLL enable timing.
>
> For easier review and management, these are submitted as a single
> patch series.
>
> The PLL timing optimization changes were merged into our internal
> repository quite some time ago and have been verified on a large
> number of SoCs:
> - Already supported upstream: G12A, G12B, SM1, S4, A1, C3.
> - Planned for upstream support: T7, A5, A4, S7, S7D, S6, etc.
>
> Based on the upstream code base, I have performed functional testing
> on G12A, A1, A5, A4, T7, S7, S7D, and S6, all of which passed.
>
> Additionally, stress testing using scripts was conducted on A5 and
> A1, with over 40,000 and 50,000 iterations respectively, and no
> abnormalities were observed. Below is a portion of the stress test
> log (CLOCK_ALLOW_WRITE_DEBUGFS has been manually enabled):

Okay, this little game has been going on long enough.

You've posted v2 24h hours ago
You've got feedback within hours
There was still a 1 question pending
The rest of community had no chance to review.

and yet, here the v3 already ! still with bearing pr_warn().

Chuan, the community is not dedicated to reviewing your submission.
Time and time again you ignore the feedback provided in reviews and the
documentation. I've had enough of your sloppy submission.

I will not review or apply anything from you in this cycle.

You have been warned multiple times. Every time you ignore a review,
you'll get ignored in return. This is how it will be from now on.

>
> - For A5:
>   # echo 491520000 > /sys/kernel/debug/clk/hifi_pll/clk_rate
>   # cnt=0
>   # while true; do
>   >     echo "------------ cnt=$cnt -----------"
>   >     echo 1 > /sys/kernel/debug/clk/hifi_pll/clk_prepare_enable
>   >     en=$(cat /sys/kernel/debug/clk/hifi_pll/clk_prepare_enable 2>/dev/null)
>   >     if [ "$en" != "1" ]; then
>   >         echo "[ERROR] PLL enable test failed! (clk_prepare_enable=$en)"
>   >         break
>   >     fi
>   > 
>   >     echo 0 > /sys/kernel/debug/clk/hifi_pll/clk_prepare_enable
>   >     cnt=$((cnt + 1))
>   >     echo -e "sleep time: 1 s."
>   >     sleep 1
>   > done &
>   # ------------ cnt=0 -----------
>   sleep time: 1 s.
>   ------------ cnt=1 -----------
>   sleep time: 1 s.
>   ------------ cnt=2 -----------
>   sleep time: 1 s.
>   ...
>   ------------ cnt=42076 -----------
>   sleep time: 1 s.
>
> - For A1:
>   # echo 983040000 > /sys/kernel/debug/clk/hifi_pll/clk_rate
>   # cnt=0
>   # while true; do
>   >     echo "------------ cnt=$cnt -----------"
>   >     echo 1 > /sys/kernel/debug/clk/hifi_pll/clk_prepare_enable
>   >     en=$(cat /sys/kernel/debug/clk/hifi_pll/clk_prepare_enable 2>/dev/null)
>   >     if [ "$en" != "1" ]; then
>   >         echo "[ERROR] PLL enable test failed! (clk_prepare_enable=$en)"
>   >         break
>   >     fi
>   > 
>   >     echo 0 > /sys/kernel/debug/clk/hifi_pll/clk_prepare_enable
>   >     cnt=$((cnt + 1))
>   >     echo -e "sleep time: 1 s."
>   >     sleep 1
>   > done &
>   # ------------ cnt=0 -----------
>   sleep time: 1 s.
>   ------------ cnt=1 -----------
>   sleep time: 1 s.
>   ------------ cnt=2 -----------
>   sleep time: 1 s.
>   ...
>   ------------ cnt=55051 -----------
>   sleep time: 1 s.
>
> Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
> ---
> Changes in v3:
> - Fix some formatting issues.
> - Move the 20 us delay after reset into the corresponding if
> condition (no delay is needed if there is no reset).
> - Move the code that releases rst back to execute before current_en.
> - Remove the patch that changes the active level of l_detect.
> - Link to v2: https://lore.kernel.org/r/20251030-optimize_pll_driver-v2-0-37273f5b25ab@amlogic.com
>
> Changes in v2:
> - Modify the judgment condition of 'm' out of range.
> - Split the PLL timing optimization patch to make it easier to review.
> - Link to v1: https://lore.kernel.org/r/20251022-optimize_pll_driver-v1-0-a275722fb6f4@amlogic.com
>
> ---
> Chuan Liu (4):
>       clk: amlogic: Fix out-of-range PLL frequency setting
>       clk: amlogic: Improve the issue of PLL lock failures
>       clk: amlogic: Add handling for PLL lock failure
>       clk: amlogic: Optimize PLL enable timing
>
>  drivers/clk/meson/clk-pll.c | 64 +++++++++++++++++++++++++++------------------
>  1 file changed, 39 insertions(+), 25 deletions(-)
> ---
> base-commit: 01f3a6d1d59b8e25a6de243b0d73075cf0415eaf
> change-id: 20251020-optimize_pll_driver-7bef91876c41
>
> Best regards,

-- 
Jerome
