Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793799154;
	b=iw2PCyhoK2I8kgiY/wb4aax5iRPKLQg3RiDZZ4xHgXSl86IMJwVi8h6tbK9yioZfV0+u
	 V0zfVWrn7d/chjCl55EtIcZ6B5meEp5WxIPlCqlZjPc7wFgWZgZJb+fqL68mxqDkk+gMP
	 DUeUwfJucPAdQRs5CA2rEERPGWn58GOmvWBm1PbCVmftSO7VFPBtINvkNWkrsQTJ1J0nu
	 zfeUR8rFcEXczeiPBWeaozEwOvd5xJKnKgwuBN1XnOL2+4Nemne2K4l8/VgIizIQTYTMu
	 8qNdhJUrOWokgA5hHRukbJIW3BbDkfZ8udfMovsH2aI5lcwHds1emIO6HqE0Uru3aRA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793799154;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=flt7oH/ETh3Es2fb8h9unV+oYzs4yKusapEzarwUpgQ=;
	b=jRNGZAN7iNDJcyCtQKFrTRf930YuvP3fd+B2ISfb8wQLHUTgan4jiuFjlcU+W+OEI9lH
	 MLyJtwv1zpz2ido2LCiamLRBFre8fHhVZ+iIDNpHRw5ACMBMfV3S+/qpCRU933Z9GOanR
	 sbu+oX+cwoOOGHbuyqqZGAp8KhyYIop/stt9J/JQYK97mJxnmKj3DphpUImrrkR5TjYPR
	 y3tlP+HixIuBy9bIh4IDXZq35NwkzjDnY/M3QeizOwDY1DzJ3hDb8yF7gY5LWoM67WMgl
	 9+MI9cm5axHyv8Qh9i9fIgOjsr27bB8IGu47mmLjDkZL6dC0nTqfAHg8t5ngdEtGVgw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qy9pS4bp;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.49
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBAC8606A32F
	for <linux-clk@vger.kernel.org>; Wed,  4 Nov 2026 13:32:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BBAC8606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qy9pS4bp
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-703be215729so238389eaf.1
        for <linux-clk@vger.kernel.org>; Wed, 04 Nov 2026 05:32:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793799153; cv=none;
        d=google.com; s=arc-20260327;
        b=fWoo0t4X0ID/9v4OS47X+VuAUT8PHhg3i6O/WMhJJN89aVK99DMMThU6HQFwX9R5X6
         lcrO98FDltF2BM4Hddvk2GVUfyjwB6h1rfVgxbhqbbA9PLsWkQbQNnlD4jej40HH/GMP
         SQzNWznPKUGxCLBKyOOjOWwM4tP8O7uuzB1toBtzu8OFDEsD9dawldUKP9UH7nV1wnvS
         ILOrW8dODds+8ZlzozHz0kaDlxNL4lZFkRlh0+l8msvsONajybBG+mumrE9RKP4uAEtl
         Or00oxrYJau+cvVZplj054YgGdNEj4uNLw4w1LvqVpSE9EQTVmPw8FxJXSClLUsJr64l
         bnIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=flt7oH/ETh3Es2fb8h9unV+oYzs4yKusapEzarwUpgQ=;
        fh=CmhQZlMk8vg3WUSAIybNTrnSMzJ+Y5N0/h2A6/oNhps=;
        b=N1qwlUgVKBYRTuu9TxozYI7znp27rNVFLOXsPVrM8gD/3bJVAtLS+k0zT0Ez0AVyI+
         TAkL65T+lbrebtLCs8ODgK6JA7VPUEXaoQsn8ck+ykIn9hCFN056yTGM8dCXj0Cnpu6N
         avL1BZ1L+0GwM0OfhxfkIgKGY4hDsJc4T3rufSms1YhRvCLqxV92hx6srs5irM6EKWDy
         jGMbwAxHaQhaSh6cTiMhvxujQ7GEfMR/qLZcPlFIBXIKdC2g7c0h+e1HXKCW/hFZ/dPc
         9dPmGNoEGYmocs5dsrvI0+lRgnFM52qAqzPIZNx00vJtp3o/h4SSlVQaZCtODT1bT45I
         oUFw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793799153; x=1794403953; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=flt7oH/ETh3Es2fb8h9unV+oYzs4yKusapEzarwUpgQ=;
        b=qy9pS4bprOjTsWRvlH9jkM15Jb6X9A27TdRPIVsM3h3dXuLNkrkluEELmjTLBM+V3P
         ncmegftrX1Jbf48M/GIiWSkyr9c2afUzcpyDNVJUxw2kErAFuFuiYBM0d4r2Z2WVe8/P
         mryc8gKuoM+SPz7kBRJsT3vcNUF1prKGEyid+vyji8hwjKqA/XununEaEOmNqxRbF7Ik
         Ay6P0FIY9Xe7oHKlx6qraSAP9Dbjx59WRcXWsOznu+IpcBB6lS5xl7kIb0TV6bN2rGXy
         D2jjv2adUgO9gp2wR1eQZMN2kZBuWpiOMzIW4Nth+vi0fpGicG3Y+McnpRkp2x+TqdRj
         /FeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793799153; x=1794403953;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=flt7oH/ETh3Es2fb8h9unV+oYzs4yKusapEzarwUpgQ=;
        b=YuFgeE1BRqs01x0SmnNbwELgm+CKNLcinqo9NraJ+vnrEcfxhPUapwYlZtcH9d/6zV
         KUdbA+h3cDd8LVdacm/f4c8Kbh4crE1E6MKBbl0BUh42Hj319fMmM1V41P9Kme5Ityac
         AON1/uWdHA06QdxTWL06EZ8hTXA+/UyyEn2FpjNaNUBw9jebUq7m++4WaEUZQdG3Xc7Q
         cJ4ickoP3CU96Y8DdZ9i5SfY7pvtpcPguiauSTX7HVACbeIdJ+5VIjktmqQO1NSwUdbM
         nZKMKIMe15rJrXM3UILBd2CbkdQ1bDzBYHCQw03m8ki3LPBOaASKxZFUBNXi1e8GCXDp
         lOgg==
X-Forwarded-Encrypted: i=1; AKwUvBxJ4zyv+uMOEdodv0vyZqc5DFEG8UzFixLBtq0SrjtqRSEH9z1wtHu5W7cyq/pQUynOrCHR73saXP8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/R94nyjjxyR7meqJkCF+RckiTIkTgQEk8taYojm4676wpEdHzE
	JQU+FTfrURhyYOFhPVr292EX4YiF+ruOrlqrwfcQCTRoFavqtJKRGV/cqfDasTMUA4HDrmQxKxM
	sT2NGCcyEpboe2kKtGyeSOnYrLPRHB80=
X-Gm-Gg: AYBFou0t68rOJbjVBhiOfo3TZfstgYHdFwFdZTXk6t0dSD+UHQUEUaiGE9oiUxYgans
	u6WSJfAmSeIK7VMftdPXBjJ8ipZII8GomML9Fe3bb51i+nvxoPbk29BBNY37R8qn/c5hvzvtd7v
	Mm05mcSAhCiptHJhTrSWoCVMNuGkKRoB0VE72dYfR9kJISE5t8uJEeppeY23ymvONxlwzgqTGbE
	q7IjwTlQXY90u0gLaIdbsntRG0S6bhZurS5TUx7cPTCIKWbnsSt3NNNWekON6xmdeSNH/ui7ldt
	4FHFJVg9mvIXLx5Yd4OP2NXJ+zjsNO1fQftLkwiUtNpZCvJ3Wa7bIktAoRH91YO8USudkX00lXE
	56nxCzIlZ0cyaGO6y+yNf5u1QQSBcLEiW0cbLFa6V3obXOGSTLZMAwmxoTg5pNw==
X-Received: by 2002:a05:6820:55d4:10b0:712:c3fb:b4dd with SMTP id
 006d021491bc7-714f2a07b44mr6865589eaf.58.1793799152650; Wed, 04 Nov 2026
 05:32:32 -0800 (PST)
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-sf19a2890-sysm-v1-0-a4fac07df823@telaak.dev> <20261104-sf19a2890-sysm-v1-4-a4fac07df823@telaak.dev>
In-Reply-To: <20261104-sf19a2890-sysm-v1-4-a4fac07df823@telaak.dev>
From: Chuanhong Guo <gch981213@gmail.com>
Date: Wed, 4 Nov 2026 21:32:20 +0800
X-Gm-Features: AclHuK9KjWGPhCZrdzN2zSc99IwcSQrcSlYV4KRQtVdLRgeo4bHU_zFbKSD1vFk
Message-ID: <CAJsYDVJ+FWHJ9AaJCmQwwfdsVJJC5mPw-fXzr2n6OAsZFHJbEA@mail.gmail.com>
Subject: Re: [PATCH 4/4] clk: siflower: Add SF19A2890 peripheral clock and
 reset manager driver
To: joseph@telaak.dev
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Yao Zi <me@ziyao.cc>, linux-mips@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 4, 2026 at 3:21=E2=80=AFPM Joseph Telaak via B4 Relay
<devnull+joseph.telaak.dev@kernel.org> wrote:
>
> From: Chuanhong Guo <gch981213@gmail.com>
>
> Add a platform driver for the peripheral clock and reset manager (CRM)
> block found on Siflower SF19A2890 and compatible SoCs.
>
> Each CRM block manages a group of APB peripherals through three registers=
:
> a reset register, a clock gate register, and a shared Bus Output Enable
> (BOE) register that must be asserted for any peripheral in the block to
> respond to bus transactions.
>
> The driver registers a clock gate controller and a reset controller from
> a single DT node. A shared spinlock protects all read-modify-write
> accesses across both. BOE is managed automatically: asserted when the
> first clock gate is enabled and deasserted when the last one is disabled.
>
> Signed-off-by: Chuanhong Guo <gch981213@gmail.com>
> [jt: from Chuanhong's siflower-7.1 branch; one compatible per block with
>  its gate bits, critical gates and reset masks in tables here instead of
>  the siflower,valid-gates, siflower,critical-gates, siflower,reset-masks
>  and siflower,num-resets properties

Why? This block is one used repeatedly inside this SoC and SF21,
I think a generic binding with clock & reset description in dt makes it
reusable without further changes and also results in a shorter driver
without a table. This table in driver aren't simplifying the dt bindings
anyway since it still needs one block per node.

--=20
Regards,
Chuanhong Guo
