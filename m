Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794841381;
	b=gRaMctanbS4rZuzbsliWBIwkIAgCCChoXnKKU0pc1FwepVFUgzd9S3w9cGexxr0au/OC
	 bgUPCUpBAycFg6oVAmaW6UaV3JyTr1FOcAUEqMOIrjLm/vW+tO1xdKQSl1o2zKdl/2NWo
	 smKe4+tlFTwQM8F3apIOd/V3QiTtYKx2VYFNFDm7DbrH9DgeqAJ3H0PeT1dqVDhFUvK9v
	 8jMLwyrwMMcLIDc3Vffdefz2RpfJN2yB/987UMQPavPAlwLcw+IXirL3rMFR8vc9ih6OD
	 ozXLtXfNQCkvvNjv5BEuIAHTYcEuXGsjPPDPYmRpBOkW+dgDVqR6gMMcgVZT6XeVd1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794841381;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=YEZ2DXJU65RbYZ4eO+cfDGZnZORS4zZkSLBULNwsguw=;
	b=d6Ki6+zAjYfSvRToaKEVncVXgCljnd/Q7I5GRbeqzqlWQDPxOp1hXFHYW8xnBMti7eWy
	 LJd7EEcTeWoKTlWT1KOjwCI2EoT4nD5/o3jOHp4E+4DEvZGWHdw9seFsZSPaa/OCDkj/C
	 tZ/LbDgsmRg5UKAsaHmtEyhmQnaKEnNu1JqOK+Kqf2X3L8ZRb+u55qB+1SG8KKWS0ia+j
	 qvZCd9JJE8aFT3ZMBPDd6TvHKoEMhMPZzDk9C43O9Tt/WvepvoQEX/XSol1aVV+Uupxui
	 hlc6prGeW8piohhpfQ/u7K60jRDHsBEHoYHkiP3ol3rP5l/oRRpRLPNOkByvEVUFp9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=drB0Ljxt;
	arc=none smtp.remote-ip=209.85.218.47
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9024606A333
	for <linux-clk@vger.kernel.org>; Mon, 16 Nov 2026 15:03:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E9024606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=drB0Ljxt
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c4d30639709so500961966b.0
        for <linux-clk@vger.kernel.org>; Mon, 16 Nov 2026 07:03:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794841379; x=1795446179; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YEZ2DXJU65RbYZ4eO+cfDGZnZORS4zZkSLBULNwsguw=;
        b=drB0Ljxt7dHrG40ww1KORhWiVcEzVArQ56NMtqkUI7231QZ7f6L/AN55e1stCFjlqL
         fA7HwhA2wMsSJzPWtahQGy5Giesqt+1W3MFERRW1XpPQ1l1m4cpx5+T0OpsvtioucCl9
         16UjIvxuSj04KjPAEcWHe0ViZMCBUMoR6BEvy8+HmAl9K9Pl91itnxo3chV1Nmbzqqng
         mFFh+OmgaBqQboe50IfEx7UqDpVaTmTnpxKX9c6gRotqe93K84SNfrHxkoxy8jqpG3LM
         JiI87T0Jzbo1dwh8Gy/IsUe9iMZuef0yWRc3Lcsi9LbI9P6TrPn8w6YaaMTx1TBKR5nV
         fjyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794841379; x=1795446179;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YEZ2DXJU65RbYZ4eO+cfDGZnZORS4zZkSLBULNwsguw=;
        b=Dij2K7wXo2r87md3sUXP7Gg/7vRUXE7xZuvjo3M54eUTYnoxQd5Ff6Ez68/5MKKIj4
         yv9JskZJ7e0uKhLXFZGPlei9AaQSi6B9MG8NKHU/AzCzPsjsc8NAqv3cQZNbpyU3YSOb
         4MnvceWfD68N+c2+7I3occ1phqB2hlqi+swQDKWSOLdjdJxp9Cw4/2afWoH0MMkWi9bM
         pH0fRKB/3IEtYyggex0sshsWCGts19jSMsBYgut7enrKvzqKeqZetMSh5LU80YBSH7zq
         f+sWLDOOHjLmeGAz90lor7pxHhxqE0EKbenqGzen6UExoLzV3k3dwTG/a1Bot61jcVMd
         kQUA==
X-Gm-Message-State: APuU4Z8+HKDZhhuLzAWaEGqS8jtkq6KKw93htXyb48g0MTz2vqmWFdBS
	Umov/WRqsyidFGMKWRxa5vSUVZAUGSO27u1fmW21fXMc2DevKqyISy2I
X-Gm-Gg: AYBFou3Jain5HoDvu2eqCDeYd3p82Z5dHfZGqATUOzQ6OIPIPCNDGsgWA+r1WGXae8I
	bN6Fo/AyXH8Kzz46ATG3w6rJs42TYg157+bB3caQeY5+qJdI5IoeWRbNy/vEZodlPDrrNlkCe2n
	DU8h81paJM+bhekwP7qXL/ZalsDrPQ5lV3lPHSQQTg8SUZkQhII4dJUmXiqEcR138inPNLVSnhw
	pJnWjd8KH52b214wlslTp58HLP4vkIeZ6aK2K/8S/6sSIgqYQDjuWDDzPBweVk0bj9chehmlMR7
	/mIdoHtxzbnEJxEQ4jE9OBMFPzgHvbfEJQ49QQVo3yl+H4GOwkTYPCbanaqWNamwn/KWZ0d1Odd
	6JtMx9TFqgFoy92fxha4khDnTSqsFNDSrtWnuD1/T9A6UednQBRe83sHIC01JWGhe3K//MqNDrl
	AT/64t7WO8wcmxxfLHIBfHfKSjJCL6+Itt9L0u3kap5wFFygeoewcMGNWEiPfbUaoAHDLcd6xEW
	F+N2l8MwK46IOfdO0LGcG6NREXel/snXAqCTHgz/F7MSD0OuTUEVq+RhGhMfhjKrJlryH07Npjd
	Gq+3r0V0AcajenUOL4IQlnqF/bYuWCpIXLaOF3LO3OsUmVIdMyjKVgDv08ot0TkmZzPtWbGOAlI
	uSbQ0uISe7N+SrLp4vAKDPqQBRTsKMUs=
X-Received: by 2002:a17:907:3e12:b0:c4d:4ce5:7733 with SMTP id a640c23a62f3a-c509642fb9emr826689366b.30.1794841379065;
        Mon, 16 Nov 2026 07:02:59 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b7eb14sm439306966b.75.2026.11.16.07.02.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 07:02:58 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Prashant Gaikwad <pgaikwad@nvidia.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-clk@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 0/3] clk: tegra114: Add CSI pad clock gates
Date: Mon, 16 Nov 2026 17:02:36 +0200
Message-ID: <20261116150239.264139-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
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

Tegra114 has CSI pad bits in both PLLD and PLLD2 clocks that are required
for the correct work of the CSI block. Add CSI pad A and pad B clock gates
with PLLD/PLLD2 parents, respectively.

This change is similar to Tegra30 pad clocks and is required for CSI block.

---
Changes in v2:

- dropped CLK_SET_RATE_PARENT form tegra114 pad clocks
- added commit to drop CLK_SET_RATE_PARENT from tegra30 pad clocks
---

Svyatoslav Ryhel (3):
  dt-bindings: clock: tegra114: Add IDs for CSI pad clocks
  clk: tegra114: Add CSI pad clock gates
  clk: tegra30: Remove CLK_SET_RATE_PARENT from CSI pad clock gates

 drivers/clk/tegra/clk-tegra114.c         | 11 +++++++++++
 drivers/clk/tegra/clk-tegra30.c          |  4 ++--
 include/dt-bindings/clock/tegra114-car.h |  3 ++-
 3 files changed, 15 insertions(+), 3 deletions(-)

-- 
2.53.0

