Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793798081;
	b=2+Mbj5SGtlkaCXO7dq+MA+UXXUz4Crye8o6/otyF+W0FPExwPk6NqlITO23sGuZCmZaY
	 IBp9j7ofZy7ndofl+JRzGpeTCDdx3ksle/ODhHA5LgxMHijpVKFs6C3ZoOEn3CfVcHTi/
	 wFVoxUDeXX1/PvHONNTdRvGFGZ/+9nEtBYtwcLEHE2pPmzmqBwRUx12YWklq3U8wBmEMN
	 UaYCSpZ28797FjR/W+xfD4RmYQHOM8Qb+UHETWNYmrdM3LrCmAtGxsrYFbMb4rv9U27bv
	 Nzh8N78V1jxUu8Rq50DiylmO0hCMxRF+J+xaXuae1I4DUAtV+D1FetUMvOtKizUNnKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793798081;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=/p5+Pyk6coILlORdcQBpVHNHSFgdC438Pn8Lrp7EWZ4=;
	b=48FrmfGyB7XNoozUl3Pr5M+MlaFHY4LVoe/Y3+U3PgWQKEZ6b1Wr003FcDoXc5a68L2X
	 qCxUu0Xrd4IwjaE3OL1NZkgh5gHNYLS+EFyvkZfvR6BLy4JhgWLznVEN53YCGjMyCGbtD
	 +IRCvh9RuNPh5EZ9WP7mqAJNriGi9HbBOpEY4K5dv9BU5ekNlgARqrGAc88aYYLdxMdOp
	 Ld29QCygksOKNqROMt15pvQ4Hklx6TAPQFOZLl3KHOqhOtgxZM00vDgLp1sncFb9UdhB3
	 VGGHyxdNDpO6m9KFFhe87H5OPoFKnt7iMKJ1q4GPL26JgE/vOoSQ2u9xxtBCQnLU93Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PSwVh+0e;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E016E606A33B
	for <linux-clk@vger.kernel.org>; Wed,  4 Nov 2026 13:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PSwVh+0e
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B99ED1F00A21
	for <linux-clk@vger.kernel.org>; Wed,  4 Nov 2026 13:14:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793798080;
	bh=/p5+Pyk6coILlORdcQBpVHNHSFgdC438Pn8Lrp7EWZ4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=PSwVh+0eCTT+b5fCxey1CsR0b6m5BP0NC9rEWv/qGoVAp7z7b/X1baMHbpDnRhHw0
	 1IlSHrcLAlVsg55IpOJF5Nkvf2vaGC/fHZEyKH+Don9up9zSqgKV37V5nainUewRr1
	 tAyK+1WI3fZ/i42mU5cbzo+HvC/82f7rkN3yxsVGBPX5SeP8DXJpSKARcrEvAMNSv1
	 RLgoTtiG3rPcDWuwk0+yNZkdNee1OkZ9GCZo58XY+OQNfYVWhHMw4oNuRfTNNgiFs7
	 4AkeoxFWz8uacgEWDIjPHFeVRqn52p+Yr5AhY/9vo5pidgnseQ+ftRBNMagtn2p8xU
	 Pbq1Di/rgQkDA==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5bcb440d1cbso428133e87.1
        for <linux-clk@vger.kernel.org>; Wed, 04 Nov 2026 05:14:40 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBxYdHBI4MFySsyDl2735JE1W5b7+/CKkEXnm1ig4/w5YQ15FUfR7GezgDafIfkqPO7nq0SS9a0b11I=@vger.kernel.org
X-Gm-Message-State: APuU4Z8VX4PMlSquRew2poKxiQE71genvluvMJyUQSJb7L+Mxt/0JH/r
	w+ACZAEXFFUUqiVED+smMjqIuOPu4qYTUJU8DdBM0t1eRXQBTgmuyjSiHaWb4wBthjyHmrY2O7p
	+QcRg5PVWSRfLdUKMnfKzCdKc5mxnhQo=
X-Received: by 2002:a05:6512:3d93:b0:5bf:ac46:c5d6 with SMTP id
 2adb3069b0e04-5bfd956d81cmr4929046e87.12.1793798079384; Wed, 04 Nov 2026
 05:14:39 -0800 (PST)
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261103-a210-scmi-v3-0-ee6b31580808@iscas.ac.cn> <20261103-a210-scmi-v3-6-ee6b31580808@iscas.ac.cn>
In-Reply-To: <20261103-a210-scmi-v3-6-ee6b31580808@iscas.ac.cn>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 4 Nov 2026 14:14:27 +0100
X-Gmail-Original-Message-ID: <CAD++jL=5SypKyjwb71hT2pzTZ3s9qi62JG_EevyjTjGgTZiE8w@mail.gmail.com>
X-Gm-Features: AclHuK-6MXT5O-NfPKrU9YAGzhqKyzaaZr6RTIvrirwYp92eUVqCIspXmcEerPc
Message-ID: <CAD++jL=5SypKyjwb71hT2pzTZ3s9qi62JG_EevyjTjGgTZiE8w@mail.gmail.com>
Subject: Re: [PATCH RFC v3 06/17] dt-bindings: pinctrl: add Zhihe A210 pin controller
To: gaohan@iscas.ac.cn
Cc: Sudeep Holla <sudeep.holla@kernel.org>, Cristian Marussi <cristian.marussi@arm.com>, 
	Michal Simek <michal.simek@amd.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Zhiguo Zhu <zhiguo.zhu@linux.alibaba.com>, 
	Jassi Brar <jassisinghbrar@gmail.com>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
	Samuel Holland <samuel.holland@sifive.com>, Daniel Lezcano <daniel.lezcano@kernel.org>, 
	Anup Patel <anup@brainfault.org>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Drew Fustini <fustini@kernel.org>, Icenowy Zheng <uwu@icenowy.me>, Inochi Amaoto <inochiama@gmail.com>, 
	Vivian Wang <wangruikang@iscas.ac.cn>, Yao Zi <me@ziyao.cc>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>, arm-scmi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-gpio@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, 
	linux-clk@vger.kernel.org, linux-serial@vger.kernel.org, 
	Han Gao <rabenda.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 2, 2026 at 8:45=E2=80=AFPM Han Gao via B4 Relay
<devnull+gaohan.iscas.ac.cn@kernel.org> wrote:

> From: Zhiguo Zhu <zhiguo.zhu@linux.alibaba.com>
>
> Add a binding for the AON, PERI1 and PERI2 pad controllers of the Zhihe
> A210. Every pad is muxed and configured on its own. Functions of the same
> kind share one name unless a pad can select more than one instance of
> them, as with the UARTs.
>
> Signed-off-by: Zhiguo Zhu <zhiguo.zhu@linux.alibaba.com>
> Signed-off-by: Han Gao <gaohan@iscas.ac.cn>

This LGTM, just waiting for a non-RFC version and DT bindings review.

Yours,
Linus Walleij
