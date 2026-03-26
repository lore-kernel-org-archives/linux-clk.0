Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B3AD33B6F8
	for <linux-clk@vger.kernel.org>; Thu, 26 Mar 2026 06:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774507082; cv=pass; b=GMHAzEDoOvHhwEcuz7srOEsouTqZCwKsQhFOcbj6NLL+vYg0nahAGz/AZXNCgme0utJabzaMrr6Bubr7ZhR6iOOctF0e3eTkSBAE0e6z4TN7Ai8LLZoucFCh0/Y44/DZzl6ZG8Cj4yoD3MI98Hgi4LoAG1Z4hLD0wulWV1Gpy74=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774507082; c=relaxed/simple;
	bh=5tVhwLNRG5DJX+OCxWP8m+5PqP4pB8W/QHKcecYw9ug=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pVCEPJzpw96+RStZkEBS0zrn0UNAyNqCimjo3Y8nbO0c5vc9jWWC7888v4/iArvbjj1fcqtoxuPtTQRTsp0/6UQI57dkonj7wqp4Btt132P1uvP0kkS0z9Nmvh2fvDMYp4VyjK7PH+1L1xGnz6hae0z5Fzvri+KP5QP9euFX2f0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=YqqVZx7c; arc=pass smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="YqqVZx7c"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5a0fc5e2c59so800723e87.1
        for <linux-clk@vger.kernel.org>; Wed, 25 Mar 2026 23:38:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774507079; cv=none;
        d=google.com; s=arc-20240605;
        b=Ge007vSuCBmSh7TnTSmfCtmye9p6rt8uRjldatJl5YBn2FdutW6z5x/v16wcT3w9rC
         GYeifNAdKEj3yAI05LLfQ69rBaWJtxfDOFid7GAnsKfD5R5qGSW6MNrq0vL0iVGzaOV9
         4vYCUWMc8gtuDjjLmWaXMO8LtsrsS9sH+bgH0l8JsXuEKIvJVZiYb/NdjH647wcMUMUI
         qaxLX9OPvbG2q5Wwu7eWdY0aM0z3cHhBMRCXura8KDEXWC2w1eLWAq4XkVPoBv/OJMSu
         y58+Ryd0k34KnCsB8m36gsYBUg0/+rIWWzsRRdkAqQGHN9NQLPOnIq+nkjZEgAmFv97T
         yQ5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5tVhwLNRG5DJX+OCxWP8m+5PqP4pB8W/QHKcecYw9ug=;
        fh=oOL8Cs27CT1nsr674Mzx7wJdGvx8R0XiGsvAN1OMTU0=;
        b=l0RS3iZUSGihAhuVFqPeojzeEVu/AsDkeuF8YAf2PoBVL752urRsO6dzOkWDYVebnd
         MQ70KjkWkgqb3wAhp9F8Fvf4W69x0MTDms/kEAXGnP7GqlNmOIvKDtcG7b7+mvb7HsgZ
         BHHksqj6vkyCTS2H3HZisIa60wtuJgd9OCK5AzDBempERr/r0AJTy/Al8wc3EGdo0j4z
         9rlTMtsDmsddLndIYOz472+1+SD6TWqK8BYhR+HofVO8NDU0azQu4p6B4PktceArHIj6
         xsUD6sFy+rY7noPi++KX0epaR76oN+FHUhcTnyrKLQEHQ0wp9fIr8H08tuyX8j2jfZrB
         BiuA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1774507079; x=1775111879; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5tVhwLNRG5DJX+OCxWP8m+5PqP4pB8W/QHKcecYw9ug=;
        b=YqqVZx7cJ1GYTlhifqyuC4eHSooyx4vA/kWzNsDg3exFTIhJS5xqRydvFESd+Z99gh
         8P1A2izK7z4xb23yI7js30AZK4QICO1+YEuQAtIKIlLir1l/JgCV+7YvMVv9OAv/mRU0
         HyR/Vhv0nDZ+XXiTKfqOF2RsstfhB92z4ioII=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774507079; x=1775111879;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5tVhwLNRG5DJX+OCxWP8m+5PqP4pB8W/QHKcecYw9ug=;
        b=Jp+lO8OZ4fLbS0VxdqRgN7v6p+DH5S4iSuVRZgT4tGQWaHd4u2tK6hVMZGy9n3VXl6
         NzNkBEAHp7f/Oljt7bLnBiWW23kyln0jS3DSVjAEDJJYlIK0Dz9Lo4wrHeSP7KGbutAp
         w2ZP+SQpXKli9p3dKfGYwdAbXTIn2OuRaTzu0KPNGrAPGE6NjSKeUheNEzXI5iIEWW0T
         SBcktjzz3hdcO2S9VKMsZKStu+UtaBeYdhXyai8KEg1QWiyC3uM2k9wBe+w4kIiPmBP0
         ZjHX7cy2/ttXn/UTXpt9t3IZRJKrB0LVbrPahzdZNlcgxcQ8KRr+CrNGGysfA54yPwaJ
         hsBw==
X-Forwarded-Encrypted: i=1; AJvYcCVLH/bqV/Jd/rXa5G2jKG/2F52x33uXi6UXkg4AAyd8Goiiczi6Wrl8NTRVve1fJgsBtUElVmSTeQU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+GJ1Q2tY/P8ZhF5ObtX6aImLI0KyE2DyAAtpik5TWu5R3+ena
	tC18KVZ4QfUev//8ZJh9f6ue3J1AgnIkjnffNCvRpEuoM0vs1PmIlp1rd6oEjtjeQy8/+HW6f8P
	3MJpiPzX9AB+G4A/RNu1qvNwZtFK2OR0Js9rPm+2u
X-Gm-Gg: ATEYQzzZlaYdw0bmftN2c+0JuhG5P+k4Ps8SRdSuY26TBzHEryr3qZj5YZhvek744Ww
	I7rOHzFt63nCZwZ+V47myLe+lcs92LC7qckbfNhXen759DZDye6HRbp9ONietWJr3sq4GeTUALj
	ve2wexszE+NheBJnRYyK1ig7t4kM4tEIxs1n08smD+Zvfzj/85OU+aUrErOMVMUA3a/MFRFoQaz
	5cx9Wjha/6N/oDJ+COzdbkQJCWNMXeSvbS7ciLfEha+O0h20Q+xCmjrrhOcYi++25qzSq8De0aR
	xK4+mCY01Pbt60Nr9qjTEl8CPCVqgUN2OaYoDw==
X-Received: by 2002:a05:6512:61c3:10b0:5a2:9bd9:3e4e with SMTP id
 2adb3069b0e04-5a29bd93eb4mr1620218e87.6.1774507078882; Wed, 25 Mar 2026
 23:37:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1774499536.git.daniel@makrotopia.org> <9667e8a7a0757f7fb9d6bb3fca105df97afd007b.1774499536.git.daniel@makrotopia.org>
In-Reply-To: <9667e8a7a0757f7fb9d6bb3fca105df97afd007b.1774499536.git.daniel@makrotopia.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 26 Mar 2026 14:37:47 +0800
X-Gm-Features: AQROBzCzCBfG5zo_X8L9j-toqTRqPRgfo1sPkCT0CAUHICe3uzlCQupUiDPCQQE
Message-ID: <CAGXv+5ERgruwWEU9mxThGNaRy9i=T-_Miumh6m9uFRtZPk8uJQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] clk: mediatek: mt8192: use MUX_CLR_SET
To: Daniel Golle <daniel@makrotopia.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	=?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>, 
	Laura Nao <laura.nao@collabora.com>, Weiyi Lu <weiyi.lu@mediatek.com>, 
	Chun-Jie Chen <chun-jie.chen@mediatek.com>, Ikjoon Jang <ikjn@chromium.org>, 
	Sam Shih <sam.shih@mediatek.com>, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 26, 2026 at 1:10=E2=80=AFPM Daniel Golle <daniel@makrotopia.org=
> wrote:
>
> The mfg_pll_sel mux has neither a clock gate nor an update register,
> and upd_ofs is stored as u32, so the -1 truncates to 0xFFFFFFFF.
>
> While upd_shift being -1 (as s8) prevents the update path from
> executing at runtime, the bogus upd_ofs value is still stored in the
> struct.
>
> Use MUX_CLR_SET to avoid passing sentinel values to wrongly-typed
> fields.
>
> Fixes: 710573dee31b4 ("clk: mediatek: Add MT8192 basic clocks support")
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
