Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795860579;
	b=z0y7Jk/D9reQ/UCYXe/3brdkhygzhGHcarv3GR1VpX4hTdhnFs2xf/Z7vNcremPmHUYD
	 sC3oEFccUJf1uX1YLVwakZp83leBNxWvXBHoO5SvByjwpw+to1Y8aZnmaTLRxXnBxjJkU
	 mvRlkFIWCtAU6yMC8OcYv0EsiaCXq/ia4EpHc3tfSo8rWpRzxJ1qZdCBenWtEtx5JciJK
	 i8KWUOf0jmU+COFxv/9IGEaSUweV2sqwb2T0scudO1qhgKYViuAyTjsFdCEcQ0X89BSbX
	 VE995h7o2Pf/SQ3i/JtsR9Dwng8AckfoptoPPAic23LVKI3W11EO4GrjWpaOo6rgrEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795860579;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=3jFkQl+1kffZkQUkv18i3cnYxd2zz1oEQ3A2zDQZ/xs=;
	b=c2kll/QUg1JcS6nCO6FO/eIkRZm1HP9E+hbwFwsToJQOvtv4NAVq0rExDbsfv7oY8QXK
	 MvubXap89zDYAZ0l5+mw4kmZc+mYmn6lxCdbKx/DNpB5JrX6MKygmn3I4coKOijzzXvtl
	 XfFfsH2QMQV9cQxUc72rvBDlFdlwCTrGhcaxg4GOgjNb7COGjwUVTxvz3vZHNDbSnJWcR
	 P+nj47Nfum/GMwNZ7DKG8A0VQkbP85RS2YnNnITD054A6wv/0BT5++lBprMPZz7BLhCbB
	 hxKXBrHyX4+t4Y/YRxFO9inMqf9p8gGXWBgttTPxn4ngo8GzqzWWpcnBc3TDWB/GT8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QRcuHncE;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1EFD606A31C
	for <linux-clk@vger.kernel.org>; Sat, 28 Nov 2026 10:09:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1EFD606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QRcuHncE
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a35ac4475dso63325655e9.2
        for <linux-clk@vger.kernel.org>; Sat, 28 Nov 2026 02:09:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795860577; x=1796465377; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3jFkQl+1kffZkQUkv18i3cnYxd2zz1oEQ3A2zDQZ/xs=;
        b=QRcuHncEDc8jX2CaVQr9tB0YRx8yimBZsVErESyXrG8bQXBU4H7Wk8vm2VCt9OqcA/
         rgNZdYjTTzbpbBp/L+SePcvq4qh4Pba+NQH3SHFxrnmXizvPvWEENXJeNXzc8s6DkJgx
         JPBC3SMKgjBvj1r70K1QD/+uU/GsP2EK7CdA63BnG0wjA14TZfIGyKEmY9rn2MEU7APp
         kg/Dk4F7QRFsWaqwUDpGyPs32nn3lOKGOzyJlefVuVagrVNrZvCKoaC/pDVdis9WYLsi
         1HGRz/YZanKjjEr2Kdw1+WKT3AdeGGa9jFtwMw7eXlVZZSHd+wk/R3YjaXoCanfb6crL
         N1oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795860577; x=1796465377;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3jFkQl+1kffZkQUkv18i3cnYxd2zz1oEQ3A2zDQZ/xs=;
        b=2GtKHw3pqYZdEBBRIEJwvBaUog/Tz4b39nnqSE5uYG0aheODgBOZdgf9gJ3pCMNSKH
         juVO8xoFyxR5KXuj6TUjuaX2V0RWDFMQzuTQZ//YZngKzcv6J/o+30NlGcaNH6pg2xCv
         MfgaDP4msVvPsxoiVnMoPqItwhCzTIJLdcHmgegJpYrViNGIi+C8SMeivgd+tV7Jo7NS
         ug1aSzYybc0YTMe9iH3IJkC9uEGszHwjdzENV+ZDFWzZdeJUA4rQfnYX3YpHXm6PmoYc
         T69bpAM/ks3FvO9ApVyh+pgHQdWcE9pFbpTQ5vafsGkKkFfDN+7XgbFirt3Jjd84BuE3
         nO7A==
X-Forwarded-Encrypted: i=1; AL+hErFkjCHQdknufyM7h5gpMKtDhzKUpbMYlHMZq4tZK5xKmc2z6yr7K3YYQdBarI/mHhwMVeyjacVuwzI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/bjPmFYajtUyw0Ii8F1/U5KWJBgdKoy83oXPLIyXvKo6Otq3fr
	JKV8lHUB0bc7JJ1iFKSCKuI9EYptjKvkr0hwr1ov+z6ncfQiXIU5vQfD
X-Gm-Gg: AZFdTZd7fEDayK69Kwf7Pi8KvTpwC0X30RJUw9YVlGTfd+yv6qfSBbD97kX37ihg6kp
	MIZj2MeIwgzdxFRYIAZe4rMaN8oVQdXkDeEECyPuwhJC0xF+nm1U8g7SgaFVMNF2wD/UYai6ydT
	EVcrGqeBWLJmuEoJXlrj9sG3vCp16F1e2VWLHPOIIFFFyAFVzgUJ0Z3nDrZlhBFw8ESuTstkRt5
	+IYroZYt5fP1lR9PM+G6I2vRWCdUUAdgBE8obYXDgXjHeNSckh958o5hPC45apMkfnwKO3BcqA4
	lAQAhpPFustjLaYLdPAX3Sw21J3UZxFQ1e7IjJEFIVlprj2dEH2KKybVF85N86jSU2xtx4oxEsK
	vqpf8wVTsZS9FEeVbldKgUDmXDZsxQfq3AD4hzqFOXZO4VdcBI5ZYU4V2PQTILKKYoU8Urbx9hS
	CM8pyO7CB3yy0JCY3IoBBY0YIBYRalBlxTvaBm5e/R8yWq5K0E0+FRus8yh40UUDJ7W/AGwoifC
	Wwl3lGFBqJ1RTWqxtBb+HB4YcuzyKeBEhYJKLEpODejTvjv1+wSoxUjqyvfhH4VR0uCdnTO99xn
	9LWcoLAk2QHThSjPrINglqLzWDxsqNauMgk7xSeKpqUkw0I7wMjdTDcorNNPqmAjvYvei76PEL/
	hdMnE0Sw9NKpOiZURYzqtvkeOyRqRQf3oxCrEQfSV7+lt5P9Zjziqd6XfIY/U77KAoG0=
X-Received: by 2002:a05:600c:a55:b0:49f:ce78:356d with SMTP id 5b1f17b1804b1-4bb88827db0mr588682865e9.30.1795860576991;
        Sat, 28 Nov 2026 02:09:36 -0800 (PST)
Received: from localhost.localdomain (dynamic-095-117-034-170.95.117.pool.telefonica.de. [95.117.34.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884a15absm698641065e9.9.2026.11.28.02.09.35
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 28 Nov 2026 02:09:35 -0800 (PST)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Prashant Gaikwad <pgaikwad@nvidia.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Thierry Reding <treding@nvidia.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	linux-clk@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] clk: tegra: Fix Tegra210 IQC2 clock lookup
Date: Sat, 28 Nov 2026 11:08:09 +0100
Message-Id: <20261128100809.97430-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

gate_clks[] uses tegra_clk_iqc1 for both iqc1 and iqc2. On Tegra210,
gate_clk_init() overwrites the TEGRA210_CLK_IQC1 provider entry with
iqc2 and leaves TEGRA210_CLK_IQC2 unpopulated, so looking up
TEGRA210_CLK_IQC2 fails with -EINVAL.

Use tegra_clk_iqc2 for the iqc2 gate.

Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>
Reviewed-by: Thierry Reding <treding@nvidia.com>
---
Assisted by an LLM.

Changes in v2:
- Drop the Fixes tag since no IQC driver uses these lookups (Thierry).
- Add review tags from Mikko and Thierry.

v1: https://lore.kernel.org/r/20261024110113.63341-1-kmehltretter@gmail.com/

Tested on a Jetson Nano 4GB (Tegra210) with a small probe module that
calls of_clk_get_from_provider() on the Tegra210 CAR node. Unpatched,
TEGRA210_CLK_IQC2 (220) returns -EINVAL and TEGRA210_CLK_IQC1 (221)
resolves to iqc2. With this patch on 5b0764a53235, ID 220 resolves to
iqc2 and ID 221 resolves to iqc1.

 drivers/clk/tegra/clk-tegra-periph.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/tegra/clk-tegra-periph.c b/drivers/clk/tegra/clk-tegra-periph.c
index 4dcf7f7..47bb657 100644
--- a/drivers/clk/tegra/clk-tegra-periph.c
+++ b/drivers/clk/tegra/clk-tegra-periph.c
@@ -813,7 +813,7 @@ static struct tegra_periph_init_data gate_clks[] = {
 	GATE("apb2ape", "clk_m", 107, 0, tegra_clk_apb2ape, 0),
 	GATE("cec", "pclk", 136, 0, tegra_clk_cec, 0),
 	GATE("iqc1", "clk_m", 221, 0, tegra_clk_iqc1, 0),
-	GATE("iqc2", "clk_m", 220, 0, tegra_clk_iqc1, 0),
+	GATE("iqc2", "clk_m", 220, 0, tegra_clk_iqc2, 0),
 	GATE("pll_a_out_adsp", "pll_a", 188, 0, tegra_clk_pll_a_out_adsp, 0),
 	GATE("pll_a_out0_out_adsp", "pll_a", 188, 0, tegra_clk_pll_a_out0_out_adsp, 0),
 	GATE("adsp", "aclk", 199, 0, tegra_clk_adsp, 0),

base-commit: 5b0764a53235d3c77e1ed674e836e1b3fe1a4b1f
-- 
2.39.5 (Apple Git-154)

