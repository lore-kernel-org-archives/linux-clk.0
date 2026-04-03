Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64D1832AAB2
	for <linux-clk@vger.kernel.org>; Fri,  3 Apr 2026 10:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775210672; cv=pass; b=bp9C7TF3RK5fS0t52FZBl2APpa69FpvAd3jMKR/btqrjMJxPyideYg0G6w6Qlpz8jAWybRavCVLiHeGjMsVmwTB5IXtdkBUQoIiWFl/Tuhvy40G16/2GuBl8y6Lr/By+OREQVdb0SIATE+KF/SRsDrhWX8fB1/wMj7EedYM+cZY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775210672; c=relaxed/simple;
	bh=5Ub2qm2j/9wtMhk2YXDRQubiyelrtrH9hR7TQ8pFlUk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Wody28it7hOmCmspcSb+tGeOCtSlpHhSmU3C2oHQ+LesQEydttryiaDQ3+KqTS/CfsUmhtX5D5S1yg67UISAzJVK9x4uArdV036prY92Y7oe69rLiaV/TH/FEDwTo+Kc8JNuSuD7EOmKr5NlOLxD6GJSs/JNmFqnM1jdZ5NU3Mg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ucio1low; arc=pass smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ucio1low"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-2bd801b4078so213500eec.2
        for <linux-clk@vger.kernel.org>; Fri, 03 Apr 2026 03:04:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775210662; cv=none;
        d=google.com; s=arc-20240605;
        b=GXlGv10ilDUh6qLjjXAEguJBaaTicGZFozziY2zfbDFQMPNoRTmEZrp8rmI2e28LFc
         srrZGEd/O7B3NhSCBMKIBuzJuckp9Bv3VmAyUQA936t+5f+v3Lg1pF3yl0djQmXtQ/B+
         IdmaN3V4I1MDmLz9v9put+4I8AOQ2Nb8b+4yks87LPwytS3hcTKVli+XBS63W0wI3Kyp
         y3W0qWk1fIzc8GbAI2q4pfcPMwPJIo0i5MJpBrnScnSUco5ldXsit7CHoaVexgMAX6S3
         G8U3d/1xk8z8wdw/JEjOQKvJmV7qGjBNwqwnVnVyqKkIXIXpGimqJVUnuNToZb9Sfa8D
         xVnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5Ub2qm2j/9wtMhk2YXDRQubiyelrtrH9hR7TQ8pFlUk=;
        fh=OusP64YAa0zQMyqCjYm8UZ9pzDf14TS+LTW8feV+mjU=;
        b=iSs3E9bn7xizqQM3wxl6mTa7XbUBLal6YWnt2trvNnBnqjrKg5IIU0nQLpjj5USSgo
         L62H0ZoE/im28YXQZc57ylBbU6R3UoyOzMNlh3oscNPm2k+ZS1H1mIbaIKosaFtnj64J
         MTq5QBbFCa12CAAZNjWJmwralWfRUs2NB5u7L+KmJQy1iNGK1nD7zQc/RGwCUGQ3l259
         PV+2ROhhSwNpNvsOTnUQ8HApruiIKF1ojh0EBP1GHmMMHiLKnhFikRKeh4u70/5VFfPL
         JOC3BcKqUHrXSNuaBMznW1KbbcNy9OHZz3LPhhgtT1GtZ47NLZscaoYrKMdC3BDikHND
         m3Jg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775210662; x=1775815462; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5Ub2qm2j/9wtMhk2YXDRQubiyelrtrH9hR7TQ8pFlUk=;
        b=Ucio1lowb9WylS43hrVgY2EBZDDnSMm+rOs4JZEGD39u3SOD6X3DzoUZkXcElf1L0+
         x6qGG/xFzNUl9ibjkl3by7YUBHYbXUjDqAZT8bWTZoKo7bl05cIj390K1pums52yFob9
         +5u18jLKs41BlAoSQ8AgAmtnCLrQ5jV71t6A1agz8VPTk/wSl8+Z3Heoh5oOi48aOLFU
         Bbu6+RCan8oMZY1M6QyJt0blR/wgp4I+IUfAc0DpfOzk6NfvZQ6F4OuaqQeNY2XfSRug
         KflFdMN6p+LhmhBdOrMCwI9eV/a5ElYf2MtBjifFwn/f7ZeAkrPgxBIPubyl9LXR4uho
         dQaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775210662; x=1775815462;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5Ub2qm2j/9wtMhk2YXDRQubiyelrtrH9hR7TQ8pFlUk=;
        b=rK8AB1y1rcVaCTwPAzjyxo7bK0SpqmIQDIUvzWcOxeJMNWgnhCdksHp9z9edZraMQB
         GoONmbso7447FPjwlf9puVhKzagRBO3TGlaE58fHOkf3XfXhYN3kRkEczIDsoOLBY8L0
         l7jf5gCtYwf1IxnOGEd0XBFXM9lG1cm3nnVyZBhZZDgnvPJkWbcIBLP+lw8rCHxzDpBb
         78W2+6v4KbZD5YtWr8aumApzmh55xHsmzhRwTTQl8yO46nasQsYxUaXHrAlObjFH9LZI
         w2z4aYDNS5mcbOxfp7US90Rb+8D6unhHkbLyPMnqTrh+9GWSFJyYdMmH/fu06Pm8PzFN
         Su7w==
X-Forwarded-Encrypted: i=1; AJvYcCXJZQ0v/haKXrz88wiDzNe/EfWAonZKoyag0X7eiKEgiu2W5yMbH0Xk9CVnHM/aH7PcVM7rtmpk7Gg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyv7RECJhEAOdz6wrds0rBOpF62c9xywi/24kuTsOOrQzsequ8W
	rUbaHpJYQbv0aLjqw0P++7Xy/RUhPtKvLmf8oKxpSQGi2o4KUq0z9TXav6dK+FF+z0ZIenY14kx
	GNvLVm6tagnsRhKNmcd3OOoswW2ML+DQ=
X-Gm-Gg: AeBDietlXssk5HGEx49UG1VxuUxRB1PQN4NiYYeT9n2gPgrJ9xVFaKS3lhGzxlFIQph
	6XC1gacovEIMO3ygbePNgRjLASbkeBbSRIPHH1UrQPxaAQxXQvWY4RlZcFtd7CaU0lH0rRQy04Z
	nXbI4P+cGB9yxWkN6EBXmwiXkMrY5ZA//6maRCr5Q4VDlE54KVH+qk1EZTqpQ3tIuZxE91f8TjU
	KHoXKggIq0zTKwd0/bro7hJE6IF73zi1nKK+E1MRxY4pSXvEw/0beawNHJ6BfJdh8R0dGDVmW2r
	ZqX+fm8GRZvvWAnf5LhAuI6hOpCIIRLY/VD8djlXRpPhU+tg/gNZ4ggjZwSQeAwzHN/rF6lcjOG
	zdpIysDH+619CBDNVMQLMURKe89IKWPSKug==
X-Received: by 2002:a05:7301:129a:b0:2c1:7ca:cec2 with SMTP id
 5a478bee46e88-2cbfce5068dmr491773eec.8.1775210662077; Fri, 03 Apr 2026
 03:04:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260223-clk-send-sync-v5-0-181bf2f35652@google.com>
In-Reply-To: <20260223-clk-send-sync-v5-0-181bf2f35652@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 3 Apr 2026 12:04:09 +0200
X-Gm-Features: AQROBzDGWGQe8LG7T9EapBc3mqC597eB6i8cF8SGIYhy3xFBCktFl3DRWuS1lDc
Message-ID: <CANiq72kZOtA27UuDZztLCAfR2rLeO=1a_ajAaza4idrC8AzDog@mail.gmail.com>
Subject: Re: [PATCH v5 0/3] Implement Send and Sync for clk
To: Alice Ryhl <aliceryhl@google.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Michal Wilczynski <m.wilczynski@samsung.com>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, linux-clk@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-pwm@vger.kernel.org, 
	Boqun Feng <boqun@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 23, 2026 at 11:08=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> =
wrote:
>
> The Clk type is thread-safe, so let's mark it as thread-safe in the type
> system. This lets us get rid of hacks in drivers.

Applied to `rust-next` -- thanks everyone!

(Given we heard nothing this week either)

Cheers,
Miguel
