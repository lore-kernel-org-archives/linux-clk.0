Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE26F4F96C5
	for <linux-clk@vger.kernel.org>; Wed, 30 Sep 2026 15:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790782259; cv=none; b=Te4j1fcEvHcmFEYjf3FOEZFvpvxhgnMratCLB71JmQWG9DrJ+fMEZTCUVBB+LjDYlGgDH3lCOgpiLqCXQEh5nYBLunPv+dvYPgvHbtoIYRjcM4yuv8dhmaTAvIACo1bH3I4Cydj+IYFwx+IRfufqYaWOqao/tcEJRf/BJHYi8bo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790782259; c=relaxed/simple;
	bh=7z2oh/5bU4y9nvxUh/Y0HwWqLErs2jeW5kbE8l93Hj8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=G19MX9yQZGxBr8WAHVQMyt6PCOPTNvbKb7AuFjphQIBHyaGN7Ckn+d2JuhclFU66nRLphLdFO41DEDZbzgGuYrpm6mrQRyuRS1+p2IkNy1KzJTYRXeVe/n8j6naM293lryuk008H1H6QWrKGyP4HKdSgAJkYVhnhzwDN8AMOkBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OgMCiPRW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OgMCiPRW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FF161F00893;
	Wed, 30 Sep 2026 15:30:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790782249;
	bh=P6mgkQPn/jJau406ySPWKhPKfaRkNuX1qxZx4rJEzYw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OgMCiPRWnVZXqrDfHMTTSfHlAY3ltB4eUWRF9se9FXLAWId6KwpDx6obF6ssj/JrD
	 n2buHwCQppO55OY/dvrpov1qy7L/Gs0I/opZVPaDPEkdBee7+cbdKmNHu54KpNLlSF
	 K2hh9P/gU1hZo+iNMS/QmMn6HnyyYsztCcqNFasAq7qekbp09ZPAH9PtJwTGYesM6B
	 cQkIqXXQEMhIFHMQ18cPHNdHyAeY/GAkdTYEADqn8IxagTU1LhMNYEJcL/AHsB2qse
	 bry4wnmJngFG7QGIqmu+uYo6LFmfg/OZ2rdKzG1VCT1MzwekAc1O7JMoDIoRJmofHU
	 BZAnmQu9cngag==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/4] RISC-V: Move common MPXY helper routines to
 arch/riscv
Reply-To: sashiko-reviews@lists.linux.dev
To: "Anup Patel" <anup.patel@oss.qualcomm.com>
Cc: linux-clk@vger.kernel.org
In-Reply-To: <20260930150213.799245-2-anup.patel@oss.qualcomm.com>
References: <20260930150213.799245-1-anup.patel@oss.qualcomm.com>
 <20260930150213.799245-2-anup.patel@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 30 Sep 2026 15:30:48 +0000
Message-Id: <20260930153049.1FF161F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] build: missing static inline on sbi_mpxy stub functions
--

commit ca97cea8474e30458386eddc230906510a535e88
Author: Anup Patel <anup.patel@oss.qualcomm.com>

RISC-V: Move common MPXY helper routines to arch/riscv
   =20
This commit moves the common MPXY helper routines and MPXY shared memory
management from the Linux SBI MPXY mailbox driver into arch/riscv. This
allows the kernel to directly perform SBI MPXY calls and share memory with
the mailbox driver when the Linux mailbox channel instance is unavailable.

> diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
> index 5725e0ca4dda3..c41e1af31a45f 100644
> --- a/arch/riscv/include/asm/sbi.h
> +++ b/arch/riscv/include/asm/sbi.h
[ ... ]
> @@ -685,7 +716,58 @@ int sbi_debug_console_read(char *bytes, unsigned int=
 num_bytes);
> =20
>  #else /* CONFIG_RISCV_SBI */
>  static inline int sbi_remote_fence_i(const struct cpumask *cpu_mask) { r=
eturn -1; }
[ ... ]
> +static inline int sbi_mpxy_get_channel_ids(u32 channel_count, u32 *chann=
el_ids)
> +{
> +	return -ENODEV;
> +}
> +
> +int sbi_mpxy_read_attrs(u32 channel_id, u32 base_attrid, u32 attr_count,
> +			u32 *attrs_buf)
> +{
> +	return -ENODEV;
> +}

[Severity: Low]
Does this omitted static inline modifier break compilation when
CONFIG_RISCV_SBI=3Dn?

Without static inline on sbi_mpxy_read_attrs (and the other stub functions
below it), every C file including this header will generate a global symbol
for the function. This typically leads to multiple definition linker errors
across different translation units.

> +
> +int sbi_mpxy_write_attrs(u32 channel_id, u32 base_attrid, u32 attr_count,
> +			 u32 *attrs_buf)
> +{
> +	return -ENODEV;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260930150213.7992=
45-1-anup.patel@oss.qualcomm.com?part=3D1
