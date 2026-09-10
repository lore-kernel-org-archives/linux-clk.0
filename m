Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7A54373BE0
	for <linux-clk@vger.kernel.org>; Thu, 10 Sep 2026 03:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789011481; cv=pass; b=hlVGo7tAoUHxPwUR+YDKqqylGL25TxX/FTR1tyS8vYvYKxyhWthYiz3rHo2pMhn//lt1EvPrTlxeMmN7n5sMNFjIEccc0H2eYaHJIQVttiID3aG5nc+xIao6PauWENNl+u72aT07mKXGsXQc6qGUkjPDsgctz5tuHFs/xQ+iI8Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789011481; c=relaxed/simple;
	bh=WVugDbv7ZX0IU+zDPoow8D0UiVs389UElI4gBI6b4QE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=baNKdxSQF0EWbm2bxfxsbIZZqzqOXCuJgxEZjAYOhowHYk8Uh87wfhkoMP3ajMSzBvtna25dZS88KKVAm5Pv+iUSNHC+LSab8EZYcEAGUVRLFM44h+0Jca//xM+KCYXW7t0DE/IpZA3UQ4i03BnFQ0jBHFBdFBG7mZwyjuEz150=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=VSBxbjul; arc=pass smtp.client-ip=74.125.224.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="VSBxbjul"
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-6711693e489so315155d50.1
        for <linux-clk@vger.kernel.org>; Wed, 09 Sep 2026 20:37:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789011478; cv=none;
        d=google.com; s=arc-20260327;
        b=lXwJi7AC8OmvpoDpi5oHa7SpLsIhzaaqJNdmchu9ulrknA0btsFuUVxtn0xwUd5zeM
         gneSV2nhEwp7v6rgpkJ4ftsWQQH/8TJDQM/ijvaswCSW34NwlWnuy7fqIiDtaKC1q7Xs
         6f8GTn0kEQyhfY2UFOEmQMMIQwhmdiI6MYLmZawzlCXvxm4q+ZdNfhn37V+vr32dlX0N
         EXRv5Y3nln3pwyxVYK715UDDNuVSn4iP+BbWZpr8X5VN5Sh3lHfaSmuNP0Fjf/9F+kkw
         yTl/m7dj5nmLcP+5oyC7aFp34mlWcajehjf5Gn/QP+zzHWeCmS2+hfEMHAaq8KRMVqid
         t/Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LvJiCgX3BpdJe3s12OP/yBUKE0PHp9qk9pkbDTxdTfA=;
        fh=kvvpdgdyUDCh+WgxwMOG7S1x8luWNuznU0TkoYhZH20=;
        b=T/Q6nn3kznd8Ca9Whs3zHly+5nZMc+sduz8iQuLPkCM2+pZ5wZ0oz+UEdaIBZQcIRh
         JYiL9g5VdE7c+qyz/y/FdiIfK3uij1EdZELz15USzUVKuxn5lhmz1BXfUob61fP1msWr
         iDZrFm6icU7KXS3RrSlEXrtFAyMxKdNfHQoxDoit84p1FBQnMiWdZo7Y6v3Pj0EecYvF
         CCgKV12TkC3TFf9Z66WLuhhIu2tY0qPkYiOFkL2kR3996kRu6mbVh/hk5J9Uu5ocUjF+
         EC8l4rYCGup6uYmE1rDsFLRKnkXBQGMdFGiDxGb+0SI1jIyPT1BNrlDaegPxZ8plP95B
         d/vA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1789011478; x=1789616278; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LvJiCgX3BpdJe3s12OP/yBUKE0PHp9qk9pkbDTxdTfA=;
        b=VSBxbjulj124IoBqzITXz5MX+bcYiDXV+R6P9MYmxZVINONqCB10LqjK7QZW8fqI6E
         lMLKVmvj5Cz3rKpkWViOxg5WaWr7rJLtwqeMw35B4+t0CC6iQst4eVBk4YcqAAK/Bpk2
         q+dbBjYCEAwz76zDMxaEMDaMRJ/blvyGGuKVM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789011478; x=1789616278;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LvJiCgX3BpdJe3s12OP/yBUKE0PHp9qk9pkbDTxdTfA=;
        b=cYuApZhnl3+VhIh/CDwheOrNEwIYApSQBnixB9Z0AFvunlD4xKkm8iqBbzCvZALUcy
         1Fn0N49Ps0FsaBWU9Ks/7QZBfaja1fYcwb4ShC1QAvBhScmKplAUuPEvMitudtC07Aq7
         H8I3KrVWwPomkIXqJE/NzjwhNj9of3bSR2qi6PDxoGu74OdM+ppxQfDVwT923D831EW4
         Mb5ATb2aUQjtTsvDQ9UALyVRYELnm8yOyq+WkXDdjSntx2bVFxdOEvQKBcsdyggfO52Z
         +sZHYNLJLr+peXtBppL8K2+w++lPQ6UmwTdLXWcPcDa3+ElyHHrvKCD2ZK8WaBlle1QI
         GomA==
X-Forwarded-Encrypted: i=1; AKwUvBy/x9o/2vU7Jg11Im1GSOWiC7Lt2LUBSUvSOWNJDjUWJVxyRyUCfM1Rc05vLY9Nccn54fOu9uDTKaA=@vger.kernel.org
X-Gm-Message-State: AFuF++nPMb6Gw8RdrdaOBsLTJSnVpEJpTpM82P8Uj1Q2RGVV3cdyCWZL
	932JFeejMSYkCLGjdkFeyUcdwIWD9k8Tafk2oW9KFxmqmRLP0Bc3XhOmOD+8QNbuVYhFFZ1ZySn
	OhiIpKHEDyZATTx3NyPjRO5yUs5/lnp1u8jQhscZv
X-Gm-Gg: AYBFou3E+r8REE8kuC8oXXTq6UPiRsIswPX4Nv+HApt40EGAtnWoxzoSnzf5R/e+uEz
	49M3UCvNJTf0yMWruZyWn5+/wD2ZaIFAITCQf5FrqHalKiSKFRGyMPkvu6rk4S8IHw5V0WJAedt
	7qGRY2dDwlGEqVBt+ttqQS2ct7KGRt8fQJnd80uW2QPyE75Ebzj0Mb6No59ZPf+N+QC7Etb0oVu
	1U0xb9taTpCQOS2a0/5d3lJUYiqzBi2Yop0yhUHvvsvC/EmTP5ubteF0Wan7q5uUkzHlng+dLkQ
	r5FzfM81KahdfhyryAMJMn0ddf5Z4Ov8LMyvXKiHlJ8M/t23lI+L6+bqYBDO8So43qZ8WyhwBsp
	HvoY9E57v
X-Received: by 2002:a53:ad06:0:b0:66f:c1bc:408a with SMTP id
 956f58d0204a3-66fc1bc4792mr7713835d50.77.1789011478612; Wed, 09 Sep 2026
 20:37:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260910033000.15926-1-kmehltretter@gmail.com>
In-Reply-To: <20260910033000.15926-1-kmehltretter@gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 10 Sep 2026 11:37:47 +0800
X-Gm-Features: AcwNN1XQH0BdJFknR3BDHpgbH-5I3YT4kBpqbiKb-tpDhIaqt5ymHV136QVN-oI
Message-ID: <CAGXv+5E7AjJLxKeq3TetBJEsPyNuKjyn_bSsQccg4g2g6xR-pg@mail.gmail.com>
Subject: Re: [PATCH] clk: mediatek: reset: Fix device registration kernel-doc
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Rex-BC Chen <rex-bc.chen@mediatek.com>, linux-clk@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 10, 2026 at 11:30=E2=80=AFAM Karl Mehltretter
<kmehltretter@gmail.com> wrote:
>
> The comment for mtk_register_reset_controller_with_dev() names the
> older helper and documents np rather than dev. The new helper takes
> a struct device and obtains its device node internally.
>
> Use the actual function and parameter names and clarify that failures
> return negative error codes.
>
> Fixes: 761bc64003e3 ("clk: mediatek: reset: Add new register reset functi=
on with device")
> Assisted-by: LLM
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

> ---
>  drivers/clk/mediatek/reset.h | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/clk/mediatek/reset.h b/drivers/clk/mediatek/reset.h
> index 562ffd290a22..b09cdcab0c4b 100644
> --- a/drivers/clk/mediatek/reset.h
> +++ b/drivers/clk/mediatek/reset.h
> @@ -60,11 +60,11 @@ struct mtk_clk_rst_data {
>  };
>
>  /**
> - * mtk_register_reset_controller - Register mediatek clock reset control=
ler with device
> - * @np: Pointer to device.
> + * mtk_register_reset_controller_with_dev - Register a MediaTek reset co=
ntroller
> + * @dev: Device used to manage the reset controller resources.
>   * @desc: Constant pointer to description of clock reset.
>   *
> - * Return: 0 on success and errorno otherwise.
> + * Return: 0 on success, negative errno otherwise.
>   */
>  int mtk_register_reset_controller_with_dev(struct device *dev,
>                                            const struct mtk_clk_rst_desc =
*desc);
>
> base-commit: 50d05c7c76c96b90462f24debacca971d2e86713
> --
> 2.39.5 (Apple Git-154)
>
>
