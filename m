Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B70CE2F0C74
	for <linux-clk@vger.kernel.org>; Mon, 11 May 2026 15:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778512999; cv=none; b=tcwgOYrxXe8q2lkdpS/cPBQwsvSrdCAB5YeQZcLjsV9fWcidlYWlOoO/Tx48FgX2wGBmZQhmQCzEsWfsQaSo+amm8sFiVUbAEkYpsm5TXFkiWCIlb2hZ+eKbKqbfpymj+WY+6M38cn0WLYflLSUVbSYZSDwLNuuGCZu/ntNT+E4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778512999; c=relaxed/simple;
	bh=c8Ubkm1ziEsqek//mhjbW78ei+1dabe/IIQaIcSfvHI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uMR31WdjYWSIV3L9hOAEk30/gvDe1nGIdQigLpnLdziXsGA3z6UaXW39mperHey9qfZxCnTjYyl1dtpmhp1rZBZOxR22n6j8ZyCyQuDyr+7A7y/IvrM09KjQ8IXtgjz4Sfz3Sr1pp8X4ucGMrhM0uezb++LbWVrYcNXOEMttbuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TBRuEoFN; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=UsnPiP1g; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TBRuEoFN";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="UsnPiP1g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1778512997;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=omy4WJN0/IH2ixY6PVE8ad6VlcN2e6pibSMeSb5zsMA=;
	b=TBRuEoFNV1HTwCABavdZk4UN6jfdST9k4p6qQCChQW/tBPTpAaIIx6uU0wMlg8VLSibycy
	IdrlRnVDUORV9fPeQ+LzOPZVSs2iE8X5OB4sU6vdbdsa1mzaZAWVXeagHZYvz5B/w+YBCk
	Q2SDJBtPnEal4m5TaVmG/AgbPEcachY=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-665-8Lc4VZAIMvKZV3IBLhmFdg-1; Mon, 11 May 2026 11:23:16 -0400
X-MC-Unique: 8Lc4VZAIMvKZV3IBLhmFdg-1
X-Mimecast-MFC-AGG-ID: 8Lc4VZAIMvKZV3IBLhmFdg_1778512996
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-909db142e45so299143585a.1
        for <linux-clk@vger.kernel.org>; Mon, 11 May 2026 08:23:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1778512996; x=1779117796; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=omy4WJN0/IH2ixY6PVE8ad6VlcN2e6pibSMeSb5zsMA=;
        b=UsnPiP1gMhseYT063gvYXQ61HBFJVpi+Lb5wvvTJUTfHRS/1JbD2UBJ79d630SX8/e
         NOyF4QFzPdEOHTcBNYisD61OKaMD8xkZCqkiYWbB2MPYFdVAGq+kJ1VqXNJTfJntW6ev
         +GP2HH8COBGdZzoTtPckac2M/lr0d74cM5lqP6e6SOdGmVaQjH85jtkUHboViOjAs7t8
         EpHmEwff/d7K7WyhfQFp3eAIWjazRabEuUG9zyvBtMsrrF0kvnYz/mwcvv9/O1x7LuQy
         fCCmcC1T+2zHa1LS4/ACf8vlOTkve4PltLvYE/WkeVkjF4ZXy3OmrKbw6pf046lxA3Pm
         ODKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778512996; x=1779117796;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=omy4WJN0/IH2ixY6PVE8ad6VlcN2e6pibSMeSb5zsMA=;
        b=ihFVKfMtsAHd2Apad6YZdRCnshsujlLgkmS5yH1CmpXKMGyla1nA9Sie1CXtZcNjYs
         rgYar8wASbQp3+kBYJr3FCq2j30w0AOGXFslxHJc08nFgkUGyUrdJn0Uy35Dddudodx6
         UBQH7Izlbxv6qNhoTYAjpt9KSqP1SIuyKfZH55vJSAw82G/fsuujKtoWCEUT1cc5V329
         V2qIqWlrP7th9DO1KCxQ0OLt0uEiwTDM/lfuf6VuAvZcMVCKR7qx4giP1z+P5WOCyCzX
         HvXYw+DiEwy/FaRSTCKcPj220uuBqp44LugVY9pJVjnlMpn1Bcq8x9jA716osLL42UHk
         1xkg==
X-Forwarded-Encrypted: i=1; AFNElJ/qLAhPzPCSC3T8EVuyfA1nXBpgB8ckd3dtUaouFUagiEsc49lKzh4gxfLIYpPNAc2fNLyAcLzsq1U=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3EMNcCHyX0xQAyAvb8/vT1F2IEZjIHoUOFRDOXvhDlkYdQV+U
	THs/PWliAQe3zgMVLTdKdUick59ho2ol2n8qOCsHqBoP7fsOza+VmMRMzmqXEsFppH3fG0stpdI
	gb/6flSuyXlikfQZCUtHk5Tk/97MYqu4W0Ys3l/MkaBNNM93WtwNvPAN4ugq8Eg==
X-Gm-Gg: Acq92OHTTudyyMpyym0B0fTcYwSnTFgvk8Aj6RKaZHVn4o396aMLN6rB4t2s0cgJo7S
	caBLWzL3483D+5deh9I+qXAmMTgttQ1LPgGd3uawVs/sF7PiamGgp7iKgwVQtOnFkhQNgJAFCuv
	SMPvCwAkQux6Vs9kIe215e+W8IbItTb1+MbwAQKI1NnoMv49NgYlPg/G9gBUzPYCfWXDI5QJtcE
	co8v4IMge4a8S5TW39nze4TKgD29ujtIakU+BYe02lSuZHZkVy4uGSpuu1IrohLvqseGJp8I6b4
	URqEnxnQ0whw6apOLvlKxKq5fbDzXIXfjUK3SvxHXsH0BwJUhmpq2US9iRXeKSk5OrDur/XYcQD
	kTJWjHoBl+AVXQLotzSZn/TpkBGxJv98mexUIU4k1EWgxVl4/2564xRKO
X-Received: by 2002:a05:620a:45a6:b0:8d6:6db0:88de with SMTP id af79cd13be357-90653728e7emr2602278085a.44.1778512995841;
        Mon, 11 May 2026 08:23:15 -0700 (PDT)
X-Received: by 2002:a05:620a:45a6:b0:8d6:6db0:88de with SMTP id af79cd13be357-90653728e7emr2602263885a.44.1778512994300;
        Mon, 11 May 2026 08:23:14 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-907b87c02fbsm1151478785a.25.2026.05.11.08.23.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 08:23:12 -0700 (PDT)
Date: Mon, 11 May 2026 11:23:11 -0400
From: Brian Masney <bmasney@redhat.com>
To: jian.hu@amlogic.com
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Xianwei Zhao <xianwei.zhao@amlogic.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 07/10] clk: amlogic: Support POWER_OF_TWO for PLL
 pre-divider
Message-ID: <agH0Xy0hD4MHjP7n@redhat.com>
References: <20260511-b4-a9_clk-v1-0-41cb4071b7c9@amlogic.com>
 <20260511-b4-a9_clk-v1-7-41cb4071b7c9@amlogic.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260511-b4-a9_clk-v1-7-41cb4071b7c9@amlogic.com>
User-Agent: Mutt/2.3.1 (2026-03-20)

On Mon, May 11, 2026 at 08:47:29PM +0800, Jian Hu via B4 Relay wrote:
> From: Jian Hu <jian.hu@amlogic.com>
> 
> The A9 PLL pre-divider uses a division factor of 2^n to ensure a clock
> duty cycle of 50% after predivision.
> 
> Add flag 'CLK_MESON_PLL_N_POWER_OF_TWO' to indicate that the PLL
> pre-divider division factor is 2^n.
> 
> Signed-off-by: Jian Hu <jian.hu@amlogic.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>

