Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7ABE2D23B0
	for <linux-clk@vger.kernel.org>; Thu,  3 Jul 2025 08:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751532299; cv=none; b=kzz8B1S+4lhTXXuyH8pV+MowmS+05q8E0dKVk0m9e1NGMlHmpIsDhrJMBXsxtt1qfTV1cHPy2tH2M9SVeOo0H52QAnR5CmqDB6oGqWg16WL9jOQLHOWP/OXr4Pghgy5u8SJDPt2DSttBfaE7Ya2+N1scC3Z+CmdzLF8SPCPcF/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751532299; c=relaxed/simple;
	bh=6gaKodRI80WQO8fQlUHCc0R+9PKjGGkDa55qKeWpLes=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=tbjIp6MFzm3U5Jz4nVNhuA6kyfEUVV6XTsDRbay4PYgsD5urbmJBLn46tISwjAYgKzxS4ANQuFzDURi9xcO+ZX6AhcgpFtn8iavKBegAUpNrXBesulgpoRLKdXt9s3TcfwGYXxNbtMHcolE6cT4wcdNJUfk02ed6I2KpW8vPXE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=kM+MN+I7; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="kM+MN+I7"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3a6e8b1fa37so4652822f8f.2
        for <linux-clk@vger.kernel.org>; Thu, 03 Jul 2025 01:44:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1751532295; x=1752137095; darn=vger.kernel.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BCaJVrU9vvGCv3HMW8UcZSchVxJ9IX/Nuw4VRhiVqcc=;
        b=kM+MN+I7CqOHwIeYYPBXmJJ/+tvg7clLy1DwG9LVrz3vtvKK6DgxjKigv+ENBAM9Tt
         MCgZ94TYKJAD+Ye3jk0pA+Zq5TgEMONqEclO62uOpKlYnYMVpgih5j6FjBUSWjwh7I9t
         kNwD8SL4SwN6vOWV4TRe6QKiNvJ+DHDqozhQsg8RgMR/n9nAgEwM9B2NIZylgmxx4BXC
         9/YfEWryw8LuhG5ppfLRpRaEhWKcL0WJ9+ilGWJoWKsAICi6GHKnbYBUBZ4TS//1KmSh
         JJos9y/aaWz/1+M4c/lpDbU9GeGdZA0gz+U4Qfg7kPS3ySueBQqb6jB3WGfGS2CYLhwM
         WFlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751532295; x=1752137095;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BCaJVrU9vvGCv3HMW8UcZSchVxJ9IX/Nuw4VRhiVqcc=;
        b=abB16yzztP8jq6v2Hmbs8uBPq85hiQNIPo4ypAV0X0fYXVIAQMIX6BtgU/l5Gt0Sf6
         ZO/7/qRdxJZjI5FAKqzZKpxrq9wXTG/dBjZkapBwUUTX2HtJD+/I3FsuhHLYDMeXyv8y
         Y3P3JKrXr6yr+YFEpCtATyFxQPOskBGG/jCG1fWvjdzdRAfEPuLvuwYL5HifAGvCdhtQ
         ZltdKLzd2WIGRiJQQ52paLuQnJzHCAUzBofgNvx2NZM/HIt93VZcbKi6dJiz4ZAEHmsn
         9wdQFVeMmYVM/UPsFael8qRjVfhEkVR5qQxrVwY66sJBHxZwiAGvmuEFXB/NRy/aVO5T
         +OJg==
X-Forwarded-Encrypted: i=1; AJvYcCWgUN/mUa042dXdB9r4jwFZR/SmW6OKWDiGKeontwyNCUKZu2qAL6Bv7PGcIQw9qs/Ee9i5jdu9LPY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwYCWLEQXUHdmg+sJ1oXZKnyhrkci9qjxsUm6PDSD8lbQQlGwRW
	C4scK2kUvuaO8WmFZeF4ae5VVLnLruPnPOBUErIYkktYiY5QeGsTkGPISUCxZpTUju4=
X-Gm-Gg: ASbGncsz23CfYj9Uf43l+U6eJeOMehDNlv2QWox3SyTywu9bWGlcgbdiepVRSZGlcee
	RiPvM5IAlGX/LIJiqTs8OjoLem+rhIhsAUsxEuJOz6IHH+t21FiE8cBtFLW1IsZz17b4Ns39rdu
	gWK58OEPUyp+zqQMbaVilShzuqt5BEDAzsg/+BYinE2SRnHbyuXFWKSH7OYCXs1TrjPEQ7+Y14Z
	NZs4wnDSeIfmZ5eed03dG/vc3q94MZXXSvBtctC/7YCrc7eVrXmuZ9m+xK+0QUTyWv8AZEj0LBl
	KpJUK/5tqrafD7WtcIG+O9jJgBXejpoy50WK73KusPn/ryrOAYGlPYBxIByHnw==
X-Google-Smtp-Source: AGHT+IF545q3PqJViLJ3tmQn2xNcqUD4C4aWOYfTnAGoUJX7T6e4Ign+bwQdPieifu8Yhl+1ojcvfw==
X-Received: by 2002:a5d:5e84:0:b0:3b1:3466:6734 with SMTP id ffacd0b85a97d-3b32de6b0f1mr2108930f8f.44.1751532295095;
        Thu, 03 Jul 2025 01:44:55 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:1b4c:1be9:25d0:5634])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a892e5f923sm17657514f8f.89.2025.07.03.01.44.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 01:44:54 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Chuan Liu <chuan.liu@amlogic.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,  Michael Turquette
 <mturquette@baylibre.com>,  Stephen Boyd <sboyd@kernel.org>,  Kevin Hilman
 <khilman@baylibre.com>,  Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  linux-amlogic@lists.infradead.org,
  linux-clk@vger.kernel.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH 26/26] clk: amlogic: c3-peripherals: use helper for
 basic composite clocks
In-Reply-To: <27ae4f23-7a41-4810-9639-5bcc4cebc8dd@amlogic.com> (Chuan Liu's
	message of "Thu, 3 Jul 2025 15:56:25 +0800")
References: <20250702-meson-clk-cleanup-24-v1-0-e163c9a1fc21@baylibre.com>
	<20250702-meson-clk-cleanup-24-v1-26-e163c9a1fc21@baylibre.com>
	<27ae4f23-7a41-4810-9639-5bcc4cebc8dd@amlogic.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Thu, 03 Jul 2025 10:44:54 +0200
Message-ID: <1jzfdlbr3t.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Thu 03 Jul 2025 at 15:56, Chuan Liu <chuan.liu@amlogic.com> wrote:


>> +static C3_COMP_SEL(hcodec_1, VDEC3_CLK_CTRL, 9, 0x7, c3_hcodec_pre_parents);
>> +static C3_COMP_DIV(hcodec_1, VDEC3_CLK_CTRL, 0, 7);
>> +static C3_COMP_GATE(hcodec_1, VDEC3_CLK_CTRL, 8);
>
>
> Note: hcodec_clk is a no-glitch clock. The current driver may fail to set
> hcodec_clk properly. A previous patch attempted to fix this by adding a
> flag,
> but was abandoned as it introduced other issues.
> (https://lore.kernel.org/all/f8c3b6e7-2f5d-493e-8254-2a27623f0d2e@amlogic.com/)
>
> This macro won't be suitable if we revisit the flag approach later.
>

But it is now. As documented in the description, the purpose of these
macro is to get the easy and repeating stuff out of the way, helping
tricky things stand out.

So when/if you fix this clock and you add tricky things, please drop the
macro then and add some comments explaining what you do and why.

>
>>
>>   static const struct clk_parent_data c3_hcodec_parents[] = {
>>          { .hw = &c3_hcodec_0.hw },
>
>
> [...]
>
>
>> --
>> 2.47.2
>>
>>
>> _______________________________________________
>> linux-amlogic mailing list
>> linux-amlogic@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-amlogic

-- 
Jerome
