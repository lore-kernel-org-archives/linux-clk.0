Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0B8F3DA5DC
	for <linux-clk@vger.kernel.org>; Fri,  8 May 2026 21:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778274407; cv=pass; b=cq6vqUfcNMTawoGzyQ2qqXxlM5Kprj//w4/uvctddh6ij/f/DBn8Owcpj0/bFY6LEFQ09Xrriy75hmdXwFaMq7XfSzq7zwRDQb+FYCcqeY1zbEVva1GsVsGLjAa0zpK7aH5Ur9sEhAMgG8IqSOjTAvdojmSK/I9AT+1gCmxrX/A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778274407; c=relaxed/simple;
	bh=uYEauDqjhlftvOYrE+WCrdDI4/YclJJd9R+dwfvfqSM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nLggcuqXw8clPdmUk/1veTHjtmWJ2S4efGkapRaxq6bRawhDxecqofFEcFeGMXjAartE4CVM0r/eH9iwrVXhPQz0blguhThYcjDbC0ZmgG/M5IgUddlPtMlL1np616A0ZP7br+D+3iH1Om4weO4+DC/qaJZwyXnK+R9TFyMbEb0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Pgj74bk6; arc=pass smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Pgj74bk6"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6746d0b2b4aso3724363a12.3
        for <linux-clk@vger.kernel.org>; Fri, 08 May 2026 14:06:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778274404; cv=none;
        d=google.com; s=arc-20240605;
        b=Unwsk8f3ZDXemIbcfyQfIZP9sL5Cwj797yCY3JqPP3sc1xzMhViQ7kcifPKi4gwny1
         Rwt5W8ttCK8qftma30okwslykrd1ZffR5RiZ80ygwMTAoGgVB2OK4BgEIr5zAdVmad1A
         1iUK0aRiKPClWwyH6SzUDvrbG31dBXgdkIbaBM2wjdEcbQY5rGEoyHOKltKpTlhXZYZ8
         bmuZ7zbSzAhy4gb831rI0IuueUQ0tMmEGgXpajFFE9u20TfNRcJAuVs5a67DrL+Pqypd
         WBOu5q4rs0HT/XvaY+SYmoK4GEPmG7LAlPvkQtFjIth8x/XYaYwSk5sDMuPqsHFm4NKd
         V6lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=DVglEzUYNidpFkHmJ+FSq7gNX4LLvQ3/JxKQt4wn7xY=;
        fh=rJ/0AUkp/9e0l8eeRGMYXgjRJjQFSdzgi1D40/YI3QQ=;
        b=VleeWE15RCcxkd0ctB95zhLb+Iv9YzmDcT8peBoLOISJRoSXBknuCk5xCxSx5uqiGK
         8dgXVQC7JCzEAIeyEef7xgdHUPUW/mSyWOknHaWmqyk0VYLg0WnBa8TegWdlbsv5VrYU
         SwK1DdjuYz6hWBUuh6fXtgKvk5zceXmtLyga+N/TC2jpuCbdN+iq9nmkNX6P4iDEo3Pn
         o4lSGYeT0Rp0/KIkKO6VNq1DNB9r/nhvr4E1eLeq09uZaX1uLovP8r4rKLort891V9ma
         E8z3gAjxVw1jhxBxcO2w/a9SaHs1ZIGMjrAyaxO/Os6FVUEP6b0r/JtbbSYmxtucTzmG
         tjdg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778274404; x=1778879204; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=DVglEzUYNidpFkHmJ+FSq7gNX4LLvQ3/JxKQt4wn7xY=;
        b=Pgj74bk6HSwa45c54hD9etgZb+9EglpXax1EDykU07APy8cmbubrtJCkdfgjD6c9jd
         1MWfWV9PZdDQdcDRiefCGls6NCqbAMgYJw6OcnjCTEiK3ZkM3E+Mv1OAo2E7jT/NkrwG
         NUOoPYYe/mZFBBkh00nsQsr2VSm2J5927opnYjNuo9ufYbHv9rEgmb6yoSOKqZBMiqjL
         eQb6p49NT/BwGVMFvCFqqktWSrrCUVgOcdHB9pY0isr4Spnli2I7k7tZTH1pw1SiOvdg
         expm92ohonB74gH3LHK8ilmclinN0vEERE5bmuKMp4rQPXGUEQAiLfW1+wvAGKrjQZ7O
         fvlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778274404; x=1778879204;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DVglEzUYNidpFkHmJ+FSq7gNX4LLvQ3/JxKQt4wn7xY=;
        b=DIo8MnZ6p1wn0oRXBUcizNGBfP2Iaclnpm9DyNIAr772BU+Ve01l2y4TKmOogWW+T/
         cXbS5BFnaupZz/4/DrZYpEKSP4A0EFlv5KNPHG/xRnbUiVMGBvuvzezjYENs+2i6hvqo
         bWpEY8khAfN0z+AS4eQaz7c7jn1XJ0F7xAo/I1EsyBYjiQD17zzziBwE1jaiGhNiNix0
         pgpGp7X9QG4t1cpsPA5zyosTkOM9cMSgasT81yKgdsah3m697DQyACPuFfrddtep6IvY
         MvHcLGdh4fe4krADg+8xaR7/clTv2a46g+ieKFWMEbQapmDneRpOC2ym8PMdQuedTaHT
         H/uQ==
X-Forwarded-Encrypted: i=1; AFNElJ8lkn8wiB4dsCuJJdYh6DkPoifgtni8iLnImQvtCmgbo4xqjcsq93nCx5ITI9jadWj5NUMd1okJWY4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwiO7UJT48iNR+mYfh6o2HcWYXyJTUpPfs8yyrk0Hl9PTesN+KC
	wOjBtPp0N+Dpo14G1AzWe+A7qk1FgpwsL0BmCuf1/8lL2LAK/Tw98I0Fdp41bTYfwB7I3kg+qjD
	Q3f5rWoIEg2xRqVMcMeCIl4Qn1eZFLrQt0WKywXW6Kw==
X-Gm-Gg: Acq92OFyoWIrmXKhTXU69Y5MiLPenRAGV7lVOflGQbrEpp0RpMmmdA7BrNFmltVr+pV
	x6KQ/ACauOq1U1zLw29Chr2pT5d/1y3afEJJIDdPJHiu93SjfGJD114c/QU2wEenwHmnHRWLn5h
	I//OIxX61gubhTJjafKJ/ghECCd8szZOpYxsLX9OJFZw01aNP6dlGz3V/t+vwgCC89wYR0wP79p
	sDH6RgGQPvAl6vF0XiWpejrFPk9S053USP4CnvIjWc8OaroNaqsWtSaz4dd4a8jqPCzH3v+IFdN
	cMK137BqYtLvtEIUaOgwNTrI389XmQz+IC3oLCGx+FPXcpj5XsHO
X-Received: by 2002:a05:6402:1d4d:b0:678:9584:fb30 with SMTP id
 4fb4d7f45d1cf-67d638a6f0dmr7231282a12.3.1778274404164; Fri, 08 May 2026
 14:06:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260506-acpm-tmu-helpers-v1-0-a9cd5daf8355@linaro.org> <20260506-acpm-tmu-helpers-v1-1-a9cd5daf8355@linaro.org>
In-Reply-To: <20260506-acpm-tmu-helpers-v1-1-a9cd5daf8355@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 8 May 2026 22:06:32 +0100
X-Gm-Features: AVHnY4I7v4dFHshHkQJXBZtedPzM4Yzg9hY4ruRsq52W36WQVSQVrcE_u_ZOUqo
Message-ID: <CADrjBPp9SSiS7ub+gtU0gRtPEg3jCy3-m8nDGPXmY6qibA3TkQ@mail.gmail.com>
Subject: Re: [PATCH 1/6] firmware: samsung: acpm: Consolidate transfer
 initialization helper
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Lee Jones <lee@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Sylwester Nawrocki <s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
	jyescas@google.com, kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"

On Wed, 6 May 2026 at 12:39, Tudor Ambarus <tudor.ambarus@linaro.org> wrote:
>
> Both the DVFS and PMIC ACPM sub-drivers implement similar local helper
> functions (acpm_dvfs_set_xfer and acpm_pmic_set_xfer) to initialize the
> acpm_xfer structure before sending an IPC message.
>
> Move this logic into a single centralized helper, acpm_set_xfer(),
> in the core ACPM driver to reduce boilerplate, eliminate code
> duplication, and prepare for the upcoming ACPM TMU helper sub-driver
> which will also utilize this method.
>
> Note that there is no change in underlying functionality. While the old
> acpm_pmic_set_xfer() unconditionally assigned the RX buffer parameters
> (xfer->rxd and xfer->rxcnt), the new unified helper introduces a
> 'response' boolean. All updated PMIC call sites now explicitly pass
> 'true' for this argument. This ensures the unified helper takes the
> 'if (response)' branch, performing the exact same assignments and
> preserving the original PMIC behavior.
>
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

>  drivers/firmware/samsung/exynos-acpm-dvfs.c | 20 ++------------------
>  drivers/firmware/samsung/exynos-acpm-pmic.c | 20 +++++---------------
>  drivers/firmware/samsung/exynos-acpm.c      | 26 ++++++++++++++++++++++++++
>  drivers/firmware/samsung/exynos-acpm.h      |  2 ++
>  4 files changed, 35 insertions(+), 33 deletions(-)
>
> diff --git a/drivers/firmware/samsung/exynos-acpm-dvfs.c b/drivers/firmware/samsung/exynos-acpm-dvfs.c
> index fdea7aa24ca0..7266312ef5a6 100644
> --- a/drivers/firmware/samsung/exynos-acpm-dvfs.c
> +++ b/drivers/firmware/samsung/exynos-acpm-dvfs.c
> @@ -21,22 +21,6 @@
>  #define ACPM_DVFS_FREQ_REQ             0
>  #define ACPM_DVFS_FREQ_GET             1
>
> -static void acpm_dvfs_set_xfer(struct acpm_xfer *xfer, u32 *cmd, size_t cmdlen,
> -                              unsigned int acpm_chan_id, bool response)
> -{
> -       xfer->acpm_chan_id = acpm_chan_id;
> -       xfer->txcnt = cmdlen;
> -       xfer->txd = cmd;
> -
> -       if (response) {
> -               xfer->rxcnt = cmdlen;
> -               xfer->rxd = cmd;
> -       } else {
> -               xfer->rxcnt = 0;
> -               xfer->rxd = NULL;
> -       }
> -}
> -
>  static void acpm_dvfs_init_set_rate_cmd(u32 cmd[4], unsigned int clk_id,
>                                         unsigned long rate)
>  {
> @@ -54,7 +38,7 @@ int acpm_dvfs_set_rate(struct acpm_handle *handle,
>         u32 cmd[4];
>
>         acpm_dvfs_init_set_rate_cmd(cmd, clk_id, rate);
> -       acpm_dvfs_set_xfer(&xfer, cmd, ARRAY_SIZE(cmd), acpm_chan_id, false);
> +       acpm_set_xfer(&xfer, cmd, ARRAY_SIZE(cmd), acpm_chan_id, false);
>
>         return acpm_do_xfer(handle, &xfer);
>  }
> @@ -74,7 +58,7 @@ unsigned long acpm_dvfs_get_rate(struct acpm_handle *handle,
>         int ret;
>
>         acpm_dvfs_init_get_rate_cmd(cmd, clk_id);
> -       acpm_dvfs_set_xfer(&xfer, cmd, ARRAY_SIZE(cmd), acpm_chan_id, true);
> +       acpm_set_xfer(&xfer, cmd, ARRAY_SIZE(cmd), acpm_chan_id, true);
>
>         ret = acpm_do_xfer(handle, &xfer);
>         if (ret)
> diff --git a/drivers/firmware/samsung/exynos-acpm-pmic.c b/drivers/firmware/samsung/exynos-acpm-pmic.c
> index 0c50993cc9a8..f032f2c69685 100644
> --- a/drivers/firmware/samsung/exynos-acpm-pmic.c
> +++ b/drivers/firmware/samsung/exynos-acpm-pmic.c
> @@ -58,16 +58,6 @@ static inline u32 acpm_pmic_get_bulk(u32 data, unsigned int i)
>         return (data >> (ACPM_PMIC_BULK_SHIFT * i)) & ACPM_PMIC_BULK_MASK;
>  }
>
> -static void acpm_pmic_set_xfer(struct acpm_xfer *xfer, u32 *cmd, size_t cmdlen,
> -                              unsigned int acpm_chan_id)
> -{
> -       xfer->txd = cmd;
> -       xfer->rxd = cmd;
> -       xfer->txcnt = cmdlen;
> -       xfer->rxcnt = cmdlen;
> -       xfer->acpm_chan_id = acpm_chan_id;
> -}
> -
>  static void acpm_pmic_init_read_cmd(u32 cmd[4], u8 type, u8 reg, u8 chan)
>  {
>         cmd[0] = FIELD_PREP(ACPM_PMIC_TYPE, type) |
> @@ -86,7 +76,7 @@ int acpm_pmic_read_reg(struct acpm_handle *handle,
>         int ret;
>
>         acpm_pmic_init_read_cmd(cmd, type, reg, chan);
> -       acpm_pmic_set_xfer(&xfer, cmd, ARRAY_SIZE(cmd), acpm_chan_id);
> +       acpm_set_xfer(&xfer, cmd, ARRAY_SIZE(cmd), acpm_chan_id, true);
>
>         ret = acpm_do_xfer(handle, &xfer);
>         if (ret)
> @@ -119,7 +109,7 @@ int acpm_pmic_bulk_read(struct acpm_handle *handle,
>                 return -EINVAL;
>
>         acpm_pmic_init_bulk_read_cmd(cmd, type, reg, chan, count);
> -       acpm_pmic_set_xfer(&xfer, cmd, ARRAY_SIZE(cmd), acpm_chan_id);
> +       acpm_set_xfer(&xfer, cmd, ARRAY_SIZE(cmd), acpm_chan_id, true);
>
>         ret = acpm_do_xfer(handle, &xfer);
>         if (ret)
> @@ -159,7 +149,7 @@ int acpm_pmic_write_reg(struct acpm_handle *handle,
>         int ret;
>
>         acpm_pmic_init_write_cmd(cmd, type, reg, chan, value);
> -       acpm_pmic_set_xfer(&xfer, cmd, ARRAY_SIZE(cmd), acpm_chan_id);
> +       acpm_set_xfer(&xfer, cmd, ARRAY_SIZE(cmd), acpm_chan_id, true);
>
>         ret = acpm_do_xfer(handle, &xfer);
>         if (ret)
> @@ -199,7 +189,7 @@ int acpm_pmic_bulk_write(struct acpm_handle *handle,
>                 return -EINVAL;
>
>         acpm_pmic_init_bulk_write_cmd(cmd, type, reg, chan, count, buf);
> -       acpm_pmic_set_xfer(&xfer, cmd, ARRAY_SIZE(cmd), acpm_chan_id);
> +       acpm_set_xfer(&xfer, cmd, ARRAY_SIZE(cmd), acpm_chan_id, true);
>
>         ret = acpm_do_xfer(handle, &xfer);
>         if (ret)
> @@ -229,7 +219,7 @@ int acpm_pmic_update_reg(struct acpm_handle *handle,
>         int ret;
>
>         acpm_pmic_init_update_cmd(cmd, type, reg, chan, value, mask);
> -       acpm_pmic_set_xfer(&xfer, cmd, ARRAY_SIZE(cmd), acpm_chan_id);
> +       acpm_set_xfer(&xfer, cmd, ARRAY_SIZE(cmd), acpm_chan_id, true);
>
>         ret = acpm_do_xfer(handle, &xfer);
>         if (ret)
> diff --git a/drivers/firmware/samsung/exynos-acpm.c b/drivers/firmware/samsung/exynos-acpm.c
> index a2cac913b2bd..88a06842753d 100644
> --- a/drivers/firmware/samsung/exynos-acpm.c
> +++ b/drivers/firmware/samsung/exynos-acpm.c
> @@ -517,6 +517,32 @@ int acpm_do_xfer(struct acpm_handle *handle, const struct acpm_xfer *xfer)
>         return acpm_wait_for_message_response(achan, xfer);
>  }
>
> +/**
> + * acpm_set_xfer() - initialize an ACPM IPC transfer structure.
> + * @xfer:      pointer to the ACPM transfer structure that is being initialized.
> + * @cmd:       pointer to the buffer containing the command to be transmitted
> + *              to the ACPM firmware.
> + * @cmdcnt:    length of the command in 32-bit words.
> + * @acpm_chan_id: mailbox channel identifier.
> + * @response:  boolean flag indicating whether the kernel expects the ACPM
> + *              firmware to send a reply to this specific command.
> + */
> +void acpm_set_xfer(struct acpm_xfer *xfer, u32 *cmd, size_t cmdcnt,
> +                  unsigned int acpm_chan_id, bool response)
> +{
> +       xfer->acpm_chan_id = acpm_chan_id;
> +       xfer->txcnt = cmdcnt;
> +       xfer->txd = cmd;
> +
> +       if (response) {
> +               xfer->rxcnt = cmdcnt;
> +               xfer->rxd = cmd;
> +       } else {
> +               xfer->rxcnt = 0;
> +               xfer->rxd = NULL;
> +       }
> +}
> +
>  /**
>   * acpm_chan_shmem_get_params() - get channel parameters and addresses of the
>   * TX/RX queues.
> diff --git a/drivers/firmware/samsung/exynos-acpm.h b/drivers/firmware/samsung/exynos-acpm.h
> index 5df8354dc96c..708f6b0102ac 100644
> --- a/drivers/firmware/samsung/exynos-acpm.h
> +++ b/drivers/firmware/samsung/exynos-acpm.h
> @@ -17,6 +17,8 @@ struct acpm_xfer {
>
>  struct acpm_handle;
>
> +void acpm_set_xfer(struct acpm_xfer *xfer, u32 *cmd, size_t cmdcnt,
> +                  unsigned int acpm_chan_id, bool response);
>  int acpm_do_xfer(struct acpm_handle *handle,
>                  const struct acpm_xfer *xfer);
>
>
> --
> 2.54.0.545.g6539524ca2-goog
>
