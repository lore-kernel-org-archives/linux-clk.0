Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795809789;
	b=apwVPzqU9GMvt5p6PZ/DG3yLpSjTlSL4hq9cAhVgFHOAsf6hYrihWLfuypACnEm9dTaj
	 2l3dSrsBuR4vfAwMjesiBVpbp/MirOXuSYW4++ghuS67BX+4Zh9qI+j+H8FT4Gox/BoPK
	 D9JXyemhVW+GydRzTQCp6kTvQ6k44oHYzyUuBUAVIFTZVchOA0QUHpAccqpulAyhGvmdC
	 RE4nGsuHKK+Ch4pZ+s9Ncd630kppN1qo8Lo01/DqvGX3p7ICerd+lhDAnZn+7A90dnJfo
	 0ZzJBV61fe/5n2kQC7pPGIx2WtXlQPy5/0xNkGUzZWKNDLVlHXzyja3FDrLWobYUVtQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795809789;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=wtusPwl7oTxkglScGF7WcIoLENdcCkcXrxudV6XyW/M=;
	b=fm9uF+upcyKGnQmybYsuEFalxc/hqHzWQTc5c/GJ947XRRqAO19Ms0tHDDk0trgNWLtU
	 3zK8xaikPCK8k/UqoZyKNg/XbRSBnslGeOM1SbbFPc32LLoSDOvdWof1m9cz4VOQEwzZ5
	 hOvSoPQNt6rVuKtJXyFe91/07qsZ1eDKyX9M69ER3JGXWPrtaKHrgZAW1q4VB4A14JPQP
	 29UOGx5gqbCtwG2oT04gYwDv692FAbPShZvkF7EK4ajZ7fgITxwKAexVcn8IGrgCaWX+y
	 VbpSOrgsh8U2ghBYmMsaMcHS3plk5DGu0EpuMVJewrLuO5G1NcQOkFk2TYk/bILQq1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=n2R6FiKp;
	arc=none smtp.remote-ip=209.85.218.51
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A1C6606A31F
	for <linux-clk@vger.kernel.org>; Fri, 27 Nov 2026 20:03:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A1C6606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=n2R6FiKp
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c50ac25cdd4so1066967166b.1
        for <linux-clk@vger.kernel.org>; Fri, 27 Nov 2026 12:03:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795809787; x=1796414587; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=wtusPwl7oTxkglScGF7WcIoLENdcCkcXrxudV6XyW/M=;
        b=n2R6FiKpuo8g8obEOm2WV36wL4nr03F4a4p5Nyd0b2wdtPQbbdxheWIYRfJxzmZb3+
         O2uuDZi0uiaRR82uvCRPvAceWhP6zDVXz1OoocXKjcgBdfGYu5+22YfyBooVCoPKn0vb
         r3D8qlvSHEZrhAGWsfmzXQbzDcPYrHAIRTqsZ8RA+mGo9ottqiGedVNrCrZjIfpbMUbK
         daqNU1T6ZxAeN6QzRxvkmpuSn/9lf6SmQK+ByQ8IC8jIHeNICeMgIr5qlFtzEkXyQDnP
         aumrrQUn8yPuqlr1pakQcTxfinAX7L31iaQpgA14Yqa4x1BmedsGkQVWOQm/ejRHzr28
         OTDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795809787; x=1796414587;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wtusPwl7oTxkglScGF7WcIoLENdcCkcXrxudV6XyW/M=;
        b=Av5Y2mXmqsFBheQ3YzD9bjFcLoPN9X2JQc4bk8FJ+N7QvAXa2MGhRFPnoewRD6bqD6
         XWFQVe2t4HLgGqey46qm7lIhCIn6yRlG0fs2apHMUd4p43EXEkOpzdDcq/9VaZwfzEPa
         fqQYku54qOBVC/26oNNV+bHNzc23eXXKLR3ON3atZgnXxSrUrjKdoIvvrcWlMEeLJBIA
         K7dERK7iM/h5WUdJLZdpOhX62UrU4bGMvnSO+F1hrAEPB620ZkIV3gDsqysbjJCVVEIw
         GltFnfwA44rAvNA6yli4bLozMAr6Hg1bN4LKN/QfPZ+CZt/jXIyUvYr/yHokeo+QBHJX
         SPHQ==
X-Forwarded-Encrypted: i=1; AL+hErHLadwFxta57uVfKrK6sz+Imtjcou7fAJJS47scjm1NZUQwfZcKRVAx7MoJjpQbzympz9RrtZH4jfE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/YTgq1o7XLUseZj5e9zLk3bbw85+GMsSMNgU4DtbT1bTqJG6vC
	WtqhkpycO7G1lAR03/VHPnz3Hi7I7Ixd5tmsWvP9AoKIpdA24zHfVteOj7LBfuSF/eg=
X-Gm-Gg: AZFdTZddWCJYyeShm5WAAZWURbvQ4ylyT09qx38ItDZDyd5xlxSfy6Wh6faUOByv6cP
	3mZ7vT2NRNasKzz3cty8V+y0/hGfLsgD8U8H3dRl/JI+NjRUUnzWBiZnADKRfRflpzYqfyOKJdO
	d+CRStygR+us6v4QzIjyKhKAIYO2Y1lC26HGG7W2OtnqQZK0XmSggiuhzTV3Y2/WmnhSaUX9J5Y
	CsIt0iQGRLIXrR2LTVucVWL5nuDTHFUtUnkDZmFJmtKJeBaZDUya4cyCN6OlyHZ7fHEaNR9DmE2
	uS1t4qsSXdg6kwPoKdSzUSKj+dh0tTVnJ8LMwHaG62DRF4jXDbbNjoae2xjm+sbBZxuUMi70TWv
	70J8nWUjdWB+drSx1TDSAmk4p5LFI4zZiheUGp6B3pnukT/TdaCbzizHXepH8xv+VFGmRJXKr8V
	J/WHUbHgAi0SVlcGBU2ZPXaoZUDay4WFRfW54Nbj2QtOO7Li23u7u24ze2WNC9Uu1kqO8v1KRqE
	LqtbJ3dK3OQubVglFwOqPd0CIdlpqMrBupZshUuM9D5fbop3qYs+QJGVDuMr7f41cSLZHQN5L57
	lcGUMdpRAdKpxyIyJyxCcXULDNSkC+xk/rjeMDEy6O8No5Je
X-Received: by 2002:a17:906:5908:b0:c3f:d8f2:f08e with SMTP id a640c23a62f3a-c513aad1aa7mr1591096666b.44.1795809786817;
        Fri, 27 Nov 2026 12:03:06 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae661b3sm897861366b.16.2026.11.27.12.03.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 12:03:06 -0800 (PST)
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 2/6] clk: Add dev_clk_get_from_provider()
From: Jerome Brunet <jbrunet@baylibre.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, 
 Russell King <linux@armlinux.org.uk>, Paul Walmsley <paul@pwsan.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andyshrk@163.com>, Ulf Hansson <ulfh@kernel.org>, 
 linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, linux-omap@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, 
 linux-pm@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
In-Reply-To: <7155949aea78042fd399da5ad23a72765b2b6cc7.1795094688.git.geert+renesas@glider.be>
References: <cover.1795094688.git.geert+renesas@glider.be>
 <7155949aea78042fd399da5ad23a72765b2b6cc7.1795094688.git.geert+renesas@glider.be>
Date: Fri, 27 Nov 2026 21:02:59 +0100
Message-Id: <179580977969.3028968.47907747276860033.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=576; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=w+BoHiPo+P6YGPZSkRwTWt/kGI08hfYqlVrPoLWDzrs=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDNmcD781zBdazCsg9lL/zber23mznz9vt33xqqNRSyql5
 9/lP4XqHaUsDGJcDLJiiiw13NXi7yS1vsyarnMbZg4rE8gQBi5OAZjIejtGhnPrDj/t/PYpMF4p
 5/BazfN3D21QT/A6eNT9yBfJZ1dZop8wMpzYzS/A8uDOTLmdR+uChb9oSs6TL/Rb7JC9947joo3
 LLnMBAA==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

On Thu, 19 Nov 2026 14:40:35 +0100, Geert Uytterhoeven <geert+renesas@glider.be> wrote:
> Clocks obtained through of_clk_get_from_provider() show up as
> "deviceless" in the consumer column of the clk_summary file in debugfs.
> Add a new variant dev_clk_get_from_provider() that also takes a consumer
> device, so callers can provide it, and consumer's name will be shown in
> the clk_summary output.
> 
> Reimplement of_clk_get_from_provider() on top of
> dev_clk_get_from_provider().
> 
> [...]

Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>

-- 
Jerome

