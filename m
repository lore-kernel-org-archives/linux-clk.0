Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 960BB47AF6C
	for <linux-clk@vger.kernel.org>; Wed, 10 Jun 2026 20:26:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781123194; cv=none; b=OS6IWbF7p9szdYrs9HAPiirsDHsymHVWF2A37N8UtKGzTN/JYmJW7RmnShNYEmtjBBk32hmoNgrxmqKcezo/Pw8VfSHy9+yVcaKmdm9fsdq5R0q6rP+M4g1ZbvvdszBPcFdWQznc4pl5MWGqGFsnfHxVRJdc0GsZLdxzS+2yt7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781123194; c=relaxed/simple;
	bh=Qg/qfxcy1BYujEy2sc6O4WT0DNPahkQDbY35wNiKJCg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CwD7cfCogaTiuqHt+fAy9N4agUKwEvbIW2lgTL3jhkks0ehUmzeoycQ5yF476JEY2DHV1kwwa4tSszmnegza4tm8byaF9e9SaWG1Fm1vlIUhwUVACB6peclmDwQonU+ItNuYCBgLrS7KvzGZ8j7STYs4qGvNltOWCOm+gxdmKqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PE7ghcoe; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PE7ghcoe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 682521F00899
	for <linux-clk@vger.kernel.org>; Wed, 10 Jun 2026 20:26:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781123193;
	bh=EVOv78TcytEnABmq4Ak0qYtCqHY/hvOG+JxIbONSMlA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=PE7ghcoePWAZpFuIxf+Vv5Dbe+hlJPETjpPCvqiL+uPXB2b8wLmX5Lx7pv2ppe55p
	 ry6JqwZnoAdYgAapT/S846Tv3mEEM0eawrkIWxJDsQGkuLy0hS+QPwvEQu+NhAtZQn
	 x3zZuL0MjKv1beuhiuQQMumalJtxJFXf+658wzKLhhF9jcl/yUXegOSJPWo7Q2FP46
	 XX4fKqJGs/9dqKwcdEhUx2G/4hww1s+xLV6sW3OaesjiBZsM37uuYiyX7ZkQ3DY03S
	 AJgnvoYPiSpZ3bpLY0ThjhWXDP+CYcx5rHCHwvcG6fSnrTqnjDBh33KFKEPPNWEw1Q
	 QMgaNa7hhNhBA==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5aa63daf2a5so7182392e87.3
        for <linux-clk@vger.kernel.org>; Wed, 10 Jun 2026 13:26:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/tTIFKifXzvlemP8dML02bpuMM9K5WfLkNVPzxl0nyD6yWrShP8vpmm8giACgOF7whPQYU9gBo8gQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzbOTDCklS3NKUJTbu9JFLJPug3dtbhkvf5cCzsTH4LF3hUan4w
	5T12/cxqP8YcscFcaU4FugtusvZv+qLAIDQL9p6LvaXuROWzsV1dyV1+QLSfKgLW7f7yQjdT3VA
	TNuv8wL8Jtnlwu+FxA+9Hlcb+87hye/k=
X-Received: by 2002:ac2:51d1:0:b0:5aa:690c:662f with SMTP id
 2adb3069b0e04-5aa87bc187amr7525783e87.23.1781123192225; Wed, 10 Jun 2026
 13:26:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260602050840.435933-1-github.com@herrie.org> <20260602050840.435933-2-github.com@herrie.org>
In-Reply-To: <20260602050840.435933-2-github.com@herrie.org>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 10 Jun 2026 22:26:20 +0200
X-Gmail-Original-Message-ID: <CAD++jLmJ_FKA0aGi2LzjC=Gz=6QWANAPFmvToWOU8yE8qj3Beg@mail.gmail.com>
X-Gm-Features: AVVi8CfTsrbWGp8YMGCHsuE_RxWsr1yNlViod6_8eYvbPMluleQ-mqJkB0lgWSY
Message-ID: <CAD++jLmJ_FKA0aGi2LzjC=Gz=6QWANAPFmvToWOU8yE8qj3Beg@mail.gmail.com>
Subject: Re: [PATCH 1/2] clk: qcom: gdsc: add LEGACY_FOOTSWITCH support for MSM8x60
To: Herman van Hazendonk <github.com@herrie.org>
Cc: sboyd@kernel.org, Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 2, 2026 at 7:08=E2=80=AFAM Herman van Hazendonk
<github.com@herrie.org> wrote:

> The MSM8x60 family (MSM8260, MSM8660, APQ8060) ships an older
> footswitch (FS / "GFS") block that pre-dates the GDSC programming
> model the existing driver was designed around. Adding GDSC entries
> for that family's MMCC power domains needs the driver to understand
> the legacy register layout:
>
>   - the CLAMP, ENABLE and RETENTION bits live in the main GDSCR
>     register rather than in a separate clamp_io_ctrl;
>   - there is no power-status bit, so software cannot poll for the
>     transition completing and has to gate progress on a fixed
>     udelay() after toggling ENABLE;
>   - ENABLE is positive-logic (set to power up, clear to collapse)
>     rather than the modern inverted SW_COLLAPSE semantics;
>   - none of the modern wait-time / HW-trigger / SW-override fields
>     are present, so gdsc_init() must skip the wait-config
>     programming block entirely.
>
> Introduce a LEGACY_FOOTSWITCH flag and the matching code paths in
> gdsc_check_status(), gdsc_update_collapse_bit(), gdsc_enable(),
> gdsc_disable() and gdsc_init(). The enable / disable sequences
> mirror what the downstream vendor footswitch driver did on these
> SoCs:
>
>   enable:  assert resets -> set ENABLE -> 2us settle ->
>            deassert resets -> clear CLAMP -> 5us settle
>   disable: assert resets -> set CLAMP -> clear ENABLE
>
> If the ENABLE write fails after asserting resets, deassert them
> again before returning so the hardware block is not left stuck
> in reset for the remainder of the system's lifetime.
>
> In gdsc_init(), clear the RETENTION bit (BIT 9) before jumping to
> the common state-sync block. The vendor MSM8x60 footswitch driver
> does the same one-shot clear at probe for every footswitch; without
> it the reset-default value is unspecified per board and a stuck-set
> retention bit would leave the rail draining power while looking
> collapsed in software.
>
> This patch only adds the infrastructure; the MSM8x60 MMCC driver
> that consumes it lands in a follow-up series.
>
> Signed-off-by: Herman van Hazendonk <github.com@herrie.org>

This looks good to me:
Reviewed-by: Linus Walleij <linusw@kernel.org>

Maybe Dmitry has a point that there is too much commenting
going on, but I don't mind much, so work either way with
me.

Yours,
Linus Walleij
