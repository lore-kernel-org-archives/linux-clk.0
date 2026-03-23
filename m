Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B672183CC3
	for <linux-clk@vger.kernel.org>; Mon, 23 Mar 2026 00:29:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774225792; cv=pass; b=Jq3af926QAFjbL9w4GtqKl+mezJxHK8SC7c6GVXfzNZk16iiHZ0F5+esXeTNwk7W9eQH2WRBX/lshzo67pw49jFNTvr72yoEKxq0HpWLcr4UNADbA4uwWy7ry8zTRqOPEpApJ4u3OGfyLSJ+ehbLNgRoRhrBNeOEi2i5QHq26nc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774225792; c=relaxed/simple;
	bh=9cbHdiwHVMGwunEQtejbJGfCgtUR/AP8Rb2GG4SIKJY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PYbxshbBqVCVXJON7a8iUmOM9Hcyxq9DgjZWDhlzjkc4/lOzK8YGRgF8PXG9hcmtgNEjoKyKimXmui2O/b/YVReDxKsnXaI4g3rEsYJFQtAOULZPdBaeCSVSPS/zGh6al/KhTWVv2YrRbWiYKIpbn7vPCMW7J1RkrSAbCpsAT5E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L4+bMxds; arc=pass smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L4+bMxds"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-2c0b6f22aa4so218154eec.3
        for <linux-clk@vger.kernel.org>; Sun, 22 Mar 2026 17:29:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774225791; cv=none;
        d=google.com; s=arc-20240605;
        b=VjO0r/qAT+DIEK6RhUwcmBLsiTFnbD1xR9txNZao1R+2ExxveMSGhTBfMVzVpoVxaM
         gh+DsXos178SOhVOSMgWnUIiTdWkLZ03LDh2whbAnZz9ujVzMdQdBab195Fa6uV5kQbI
         oU89bAY720FbP+Id+cdxskOOS0ZkftJuI5nQlZk1ibT1x7TMkqQmhA031UE7vgDxgmSy
         RSEx06AQQY8HEivu5kU5/EO/o0RVwefxyRDL01pKY/1KLwiCiifaFv1GUZPZMHRfcS9D
         j7xjR3Vjm67O0qsLbC2MQhsoix+hYEXP59920xpYE2OWJMrOR8R5gBZwx4tZEGaJWOhk
         2DWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9cbHdiwHVMGwunEQtejbJGfCgtUR/AP8Rb2GG4SIKJY=;
        fh=kDNSmdm7ywjCCcNEo3ZZ9EAIKJtXZCzPFxc5WXaSlj4=;
        b=FAJtUJP9ybDz2f8PrJ5TgPV7qiAz0ai9G2ESYHKtgc/LsUzafXVZ8GZNAUd3TZH5CJ
         9bnbdAdUXHfw6ubu7klsJexssGctnax5PAM5R6YKWYWEspBaS2EB4zDBL/7/Jrd3h6eV
         P2GpLWJ0IhwTg4NWwuMcIA8G+pqv+MVXNicceGJhHGciSDYEvcC5IUmUDerl26cB94PH
         NYK/aWI1IbR2rYuQrbE/+HG0Iv4eXm5PF3zG634KM9fsPI5YPCtJBtJL+iqcuFItazRN
         ssmJdNBSd+bjZkuOtfyeZjEi5CD7C88IenJrFXqLUaZUHqXqvg6rIz6SBv+KPVMJODb1
         rDJQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774225791; x=1774830591; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9cbHdiwHVMGwunEQtejbJGfCgtUR/AP8Rb2GG4SIKJY=;
        b=L4+bMxdsyOvjNUJmmgOMJ61YIFEOI6sVTpta5OQKCSIJMsjzGDsDWDyXyi5mRunoBE
         cMzMCm8F5nwYStA7JCfuIQksncHUxW7CZ1IxyU/EdFZ1iqAjs7Ci7omYDGEyiDFc7/N+
         hrQgbMCnzkJL2oieDU/CP09xahqThS+kqwLM8zAViF70vNIR0Oy9M9L8afEjoVCCfH2b
         uNmQcaWICI7JsFrdy4BTI1fQWKrbRYjYd7WxxQ/n+6sahsgmvTLWceFB1nW/iGzFBh1d
         m13bGOPqfqmCklXlbQaBQujwmKc6JRh1w9ROhVV+9zygFXsvO0nxOSbXvGEx+/eIF0DU
         +5bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774225791; x=1774830591;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9cbHdiwHVMGwunEQtejbJGfCgtUR/AP8Rb2GG4SIKJY=;
        b=fbPayESzICh2qgxZ+d7Lgp0SuDn75gWz1wLrnIneHkqU2vwseSbmqCVkqMVgi3yWZE
         JZKLuARqwQkeQvBttvq83ElGA6TRoxcMZiJV2TG9m0FmYjXvGsvIhNAO8Ii5GKTN+u/L
         noehMWvxb2s8q9YdKUecfHbQ/sjAR+zuHmIxgDrUSJZvCLZ/KrA2l8a/enjQxdPTXG31
         vmRhwBf5JKijgRBhV4QncOhufcS2ZUmsRehJj4Z7sZq3gS5twxy8IZKiyartFOWBRbqd
         jef2OrEkGUOdam0GcNBVN8tbMP1eiasycXUic5XhmuOgUjRkzNafPU6yW/0b2JzXozOH
         KtRQ==
X-Forwarded-Encrypted: i=1; AJvYcCU12cG/bje8orrZHgU71iApHPf1hHVd+jhAG3QuMLJ5cfPXEGbykl4j81oelnIPRmiBpj3U1o6U7ys=@vger.kernel.org
X-Gm-Message-State: AOJu0YwtBqPWqqRwHjaLK7jyELLN1zjHZXeodlSQMZvbEEJVx9IpCBk/
	jsyQP7UtMPv1rpzRJMzi7nkcNNLMuxTtXA6WzTLHCbUKL1Anb2dTNcIa00ha6ONFcUEo6rTOCeZ
	4PoOxLlXLDFYkP+4RCTzFJ8OvwLrEhZ8=
X-Gm-Gg: ATEYQzxgbtJJLjkarsbX8J0lATZRmwP5WQVp1xyN6kIEXwyqg4zGlrIkEH2AE3Q1D6L
	eRUH9Na3rqs8f1ZFxZpI3IP9y2PNQKOvIdTltcJUredzjNdXxGUWTLv3KK6OiN9nasXln7SH1EV
	1r2BgAvotHKdmggQ7VuMQSCH4EZKkP8vcev8ENmVyqlB3iVTNoJWOKlMXdAG2EyJTHs3JCucd2q
	ooQpwPCHH4XboybcENLphpBvFnt+ZZFETDWWpaqugjL+cQoRw9unbHbr/2MqtwqZ1jMYx4Phvje
	fj+HnFE2OTYQpYflxkYfVQqvX1m+Qi7V0zcElYArpBfebSQkYIqjgaV4I4bl8o9EwlP4asfDOk5
	aObXZXk89YsQvgLNyULdWlFU=
X-Received: by 2002:a05:7300:aca5:b0:2bd:a3fa:9bdc with SMTP id
 5a478bee46e88-2c109862618mr1863580eec.5.1774225790638; Sun, 22 Mar 2026
 17:29:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260223-clk-send-sync-v5-0-181bf2f35652@google.com>
 <DH7L09UFWGTK.2MT0OTWH1DUV4@kernel.org> <20260321-awesome-hot-kingfisher-5d9f55@houat>
 <CABx5tqJvOFEzmadeXpDxSUjkghviqtP0jo+kzSB5X6u_P_j2ig@mail.gmail.com>
In-Reply-To: <CABx5tqJvOFEzmadeXpDxSUjkghviqtP0jo+kzSB5X6u_P_j2ig@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 23 Mar 2026 01:29:38 +0100
X-Gm-Features: AQROBzA_7BqFHE98PrvfdrcuinIkR-uI5M2p9UFW_-ESSorfSt0DS6xmhkt5poA
Message-ID: <CANiq72kAhVALH=CoQ37GPOKp_w=3_kZYu3Rkwnwc4CX3V5e9Sw@mail.gmail.com>
Subject: Re: [PATCH v5 0/3] Implement Send and Sync for clk
To: Brian Masney <bmasney@redhat.com>
Cc: Maxime Ripard <mripard@kernel.org>, Danilo Krummrich <dakr@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Michael Turquette <mturquette@baylibre.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Drew Fustini <fustini@kernel.org>, 
	Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Michal Wilczynski <m.wilczynski@samsung.com>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Daniel Almeida <daniel.almeida@collabora.com>, 
	linux-clk@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-pwm@vger.kernel.org, Boqun Feng <boqun@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 23, 2026 at 1:16=E2=80=AFAM Brian Masney <bmasney@redhat.com> w=
rote:
>
> I'm planning to send another clk pull at the end of this week and I'll
> include this series.

Thanks Brian!

Cheers,
Miguel
