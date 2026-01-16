Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 476282D7802
	for <linux-clk@vger.kernel.org>; Fri, 16 Jan 2026 20:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768596415; cv=pass; b=MP9S/TzgM5HTYz1pg9o/N6DgsxCxhUWA3q0FcwnouPXF3OE/zu7YZLQUA0BPxk8XizsKOBe754YJE3trSUEktaGfISMAo4yT56zIzEE1Jfm7a/mHA9RmflNJOaiGjFKD4R2cTE8TDJKW0ebahbWCpLv+dkAvxf9jhL4R0Qzq3zI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768596415; c=relaxed/simple;
	bh=AcNOPclJc/EhFlX0szxnG8r82N8U9VQwdVZFKPK0yLU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=npzUsN+PmHXz/4S0tIjrKajnZt3ABkENk0UiuE5JCv72RR+isvdAGYdIxFf+deisw0putjtmMX71wY0aLicCVKD5ZqNhyFVAjUj/OzSbI/tbK8d47JXSFAhuNfXRuPOWOz+YiqzQM7r1B29rLj+0gS8Jcb2ZHnQ7FQBca47GA4Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tenstorrent.com; spf=pass smtp.mailfrom=tenstorrent.com; dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b=g0cS0o0v; arc=pass smtp.client-ip=74.125.224.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b="g0cS0o0v"
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-640d4f2f13dso2621232d50.1
        for <linux-clk@vger.kernel.org>; Fri, 16 Jan 2026 12:46:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768596413; cv=none;
        d=google.com; s=arc-20240605;
        b=WrmjPqrjYjwGJn0nSSYhCzbfG9RcKRv4fy3ilYTIKdUcW43Sp+YSypDno3ZLgHGFsI
         qqa34nEKmodOR0GUKTPkck1MveDplj+AI2SpRN1EzSoBPMM0WhK65LhQqtdQPEjsjdQ4
         O9rveki14sZoWBizPFJdCCj6UlJbEDsFtaAY2IebKA8DqQIwCRo2fK8FTpXYz5CEnfxL
         tyK9NOKEO66ZKSqCGLRRp+XnMYUrR3rkh1sWrHU+d3kOrFtbevukKP2f3ZzbwItfTTHz
         P77QzdXvfWiWj8KY+dWwixGsf+42ixUC0WH6l7DuBsa4qGTeZW94eNRtjPX87v2Dl1eE
         +xMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AcNOPclJc/EhFlX0szxnG8r82N8U9VQwdVZFKPK0yLU=;
        fh=kKQSlf57VA16yRnY2BuhSrUbsBcxlVJlh3f/ewa/8BA=;
        b=Do+ePmuSR0YL70h4ql/36cvf5a7LstC/Cw9p9RqhkVuwA2UoKUapJuBoTV6hpvtD2K
         bnzFBYcG0EJB6HOFr+5hBE0Mdsd9Yg4Lwp7vaGOCqP62ZLQu7xUipcznahpa7b/Efvip
         D0vbIlzCEZx8j3+Tb8/cPSp1BRBLzSZMQjWl1m+wqgkHGT0lYP6leEjmeOf9aM/pvcCV
         4nw+MmjDokji5j9iCxX9XrRmIJgL58j6OBZiOJyNc8RVugMWxRuhOPb3TZkt4R+ypJUH
         k/4zdEBKZi8ezDYszcZ9ZLw5J9/cq65qsKWRAZ9CrImbOEe25S2cKcFnaYGETA2yvDmU
         KChA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1768596413; x=1769201213; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AcNOPclJc/EhFlX0szxnG8r82N8U9VQwdVZFKPK0yLU=;
        b=g0cS0o0vqhcljfECjHhmXQN+65JZ5VybKIplBkpE4Wor/Vi6oW69FsUs/eT9pAlJ2D
         heu4hxBcYrgBLcYE2LEGdrXRv5hoTcRsgaqdZkCILfMtbXVcp6wSfiZUa5vW8TOJfG49
         3a68+c+Xxbr5BrFcV0gh5OpduFqOtjWehNSCj3LhvLIErJxnuDQxIZru+TU1WnQaRn4I
         hhW7c8v5t04EUYN2KwsKkKYi0P17weEDO2Q1P/htv4P7PfxLNOWuKqqoCATSErWboE3m
         PqcNE3oqtefQae/yiYdRIUn4bBXZtR9627BCRtJ3hPzMFW+7T289D1kBoTwnb3cBRk/u
         oOJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768596413; x=1769201213;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AcNOPclJc/EhFlX0szxnG8r82N8U9VQwdVZFKPK0yLU=;
        b=CVkJv91IXMiUg0tmp24zryFa+KhCiIAJTiLFM/lGMh1DLlWd5dkibRBrtuBpCWDN7Q
         U6YFppxgME+Gi9ghdhpfLiw1lhobexTp+a3E76ciQVMs8TUd4Ag7eE3U8NgQGTKZT4m4
         i/FUCjuawQHGkoDiBNI4m7z6H/Q/sOvr/PFptl/z98ObGzku6G0PK5CO+LhLMWLoJ/rR
         VoDe7MlUupsXHF+gl4S/0tRshx7eDPbJuv0Ov87Smn8fQKD9AiTW0IhEZV9CkM0TSYg/
         mBPBB6Trotl4TPcF5HG3uUiYS1S2l7couYTnCeEP2w0IfVjKRIHZSnMviYVqApJtlEk+
         iIUw==
X-Forwarded-Encrypted: i=1; AJvYcCV+sqNqZLWkgj1Y6h69yZttSNb8/ogYKZDqiWcWK2G8rIIFE3COUWhwOro9rTx91dziPXXDS8jnrd4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5sbDOKkaz3xnTKhieAv52nZn7dP0RMg3EwNI9zN+FOHEVoJQu
	Ln6rEjXjTtqBMBD4CCLLKfqKfr2xL1PFpHHGhOf2ZCUAdWAG64GPlW88wqm5M9HJY5b6S+c1nOs
	Bw4HT55dWGJxo2h+MX8bUvb/HqbqaRtcrhkZr1j46cg==
X-Gm-Gg: AY/fxX7iPeRMix7yhsMQTbjCRS1b/BrVd6fztHPrvaMry8dW+nzoYG619lgfR1j8eyq
	zGLRrq6ej5NIGSI+kNCm2T93noFxbzj0nIdNjRA62roqO44D2q/FRdoork6yCPRiVu9oQD04zRF
	mXGFlAKJgO53UK4aIOkScsZPqe9GCxUCHA1t9qkg8AuZIG+IaefAyWuRBF9TgCqWfOeaK2I0oaQ
	vSYf5t2c0ylP3kPDYRIv8jKcC0SpDB9EjdcC6Jq7HCnQ5pZF+okblC96RrsWMFFlgnXMxxRdH6D
	vrkyXTUONQMuy4Pr4Bxns2TgcGxfItuVZGlzw1RaRKnGf6xmNmuholtQFdM+
X-Received: by 2002:a05:690e:b8a:b0:644:4259:9b64 with SMTP id
 956f58d0204a3-649164f80c1mr3486002d50.59.1768596413369; Fri, 16 Jan 2026
 12:46:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260115-atlantis-clocks-v1-0-7356e671f28b@oss.tenstorrent.com>
 <20260115-atlantis-clocks-v1-3-7356e671f28b@oss.tenstorrent.com> <aWmc73irBAM8DZwF@redhat.com>
In-Reply-To: <aWmc73irBAM8DZwF@redhat.com>
From: Anirudh Srinivasan <asrinivasan@tenstorrent.com>
Date: Fri, 16 Jan 2026 14:46:41 -0600
X-Gm-Features: AZwV_QiHsFgdKPq-3jvX1L38hlBJ19C7RbwabDn7wX-L0sq8clCAb2c4AtrN_hc
Message-ID: <CAEev2e-wOYPYVMtCVZw=kQiZeXjM3ZUmsAMGG8MuM2Oo6SXE-g@mail.gmail.com>
Subject: Re: [PATCH 3/8] clk: tenstorrent: Add Atlantis clock controller driver
To: Brian Masney <bmasney@redhat.com>
Cc: Drew Fustini <dfustini@oss.tenstorrent.com>, Joel Stanley <jms@oss.tenstorrent.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, joel@jms.id.au, fustini@kernel.org, mpe@kernel.org, 
	mpe@oss.tenstorrent.com, npiggin@oss.tenstorrent.com, agross@kernel.org, 
	agross@oss.tenstorrent.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Brian,

On Thu, Jan 15, 2026 at 8:05=E2=80=AFPM Brian Masney <bmasney@redhat.com> w=
rote:
>
> Hi Anirudh,
>
> Thanks for the patch!
>
> Please sort the headers. clk-provider.h is listed twice. Remove the
> unnecessary newlines.
>

Understood, will fix this, the newlines and add the return PTR_ERR(hw)
statements.

>
> Should the parent be defined in device tree instead of statically in the
> driver? devm_of_clk_add_hw_provider() is called below, and it calls
> of_clk_set_defaults(), which will allow the use of the
> assigned-clock-parents and assigned-clocks properties.

Yes, you are right. I will switch it over to this.
